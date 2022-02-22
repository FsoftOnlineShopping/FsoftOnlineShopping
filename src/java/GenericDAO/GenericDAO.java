/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GenericDAO;

import DBConnection.DBConnection;
import Mapper.IRowMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class GenericDAO {

    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;

    /**
     *
     * @param <T>
     * @param sql
     * @param rowMapper
     * @param parameters
     * @param parameter
     * @return
     * @throws java.sql.SQLException
     */
    public static <T> List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters) throws SQLException {
        List<T> result = new ArrayList<>();
        try {
            connection = DBConnection.makeConnection();
            statement = connection.prepareStatement(sql);
            statement = setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                result.add(rowMapper.mapRow(resultSet));
            }
            return result;
        } catch (SQLException e) {
            return null;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        }
    }

    private static PreparedStatement setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Float) {
                    statement.setFloat(index, (Float) parameter);
                } else if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                }else if (parameter == null) {
                    statement.setNull(index, java.sql.Types.NULL);
                }
            }
            return statement;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean update(String sql, Object... parameters) throws SQLException {
        try {
            connection = DBConnection.makeConnection();
            connection.setAutoCommit(false);

            statement = connection.prepareStatement(sql);
            
            statement = setParameter(statement, parameters);

            int row = statement.executeUpdate();
            System.out.println(row);                        
            System.out.println("!");
            connection.commit();
            return row > 0;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
            return false;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        }
    }

    public static int insert(String sql, Object... parameters) throws SQLException {
        try {
            int id = -1;
            connection = DBConnection.makeConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement = setParameter(statement, parameters);
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
            return id;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        }
        return -1;
    }
}
