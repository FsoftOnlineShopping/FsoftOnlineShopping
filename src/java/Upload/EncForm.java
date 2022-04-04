/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Upload;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Minky
 */
public class EncForm {
    public  EncFormResult getEncFormData(HttpServletRequest request, ServletContext servletContext)
            throws ServletException, IOException {
        try{
            List<FileItem> items = parseRequest(request, servletContext);
            
            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();
            List<FileItem> fileItems = new ArrayList();
            HashMap<String, List<String>> formField = new HashMap();
            while (iter.hasNext()) { //If the ItemList is a FormField, not a file
                FileItem item = iter.next();
                
                if(item.isFormField()){
                    String itemFieldName = item.getFieldName();
                    String itemValue = item.getString("UTF-8");
                    System.out.println(itemFieldName + ": " + itemValue);
                    if(!formField.containsKey(itemFieldName)){
                        formField.put(itemFieldName, new ArrayList());
                    }
                    formField.get(itemFieldName).add(itemValue);
                } else { 
                    System.out.println("filename: " +  item.getName() + " [" + item.getSize() + "]");
                    if(!item.getName().isEmpty()) fileItems.add(item);
                }
            }
            System.out.println("fileNames: " + fileItems.stream().map(fi -> fi.getName()).collect(Collectors.toList()));
            return new EncFormResult(formField, fileItems);
        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public static String uploadFile(UploadItem item, String relativeSavePath, HttpServletRequest request, ServletContext servletContext){
        System.out.println("destination path: " + relativeSavePath);
        
        FileItem fitem = item.getItem();
        
        String[] filenameSlipts = fitem.getName().split("\\.");
        
        System.out.println(Arrays.toString(filenameSlipts));
        
        String type = "";
        if(filenameSlipts.length >= 2) //check if file have extension
            type = filenameSlipts[filenameSlipts.length-1]; //get the extension

        String filename =  item.getName() + '.' + type; //change filename
        System.out.println("changed filename: " + filename);

        Path path = Paths.get(filename);
        String storePath = servletContext.getRealPath(relativeSavePath);
        System.out.println("storePath:" + storePath);
        String uploadFilePath = storePath + "/" + path;
        File uploadFile = new File(uploadFilePath);

        try {
            fitem.write(uploadFile);
        } catch (Exception ex) {
            ex.printStackTrace();
            return "";
        }

        System.out.println("File Path:" + uploadFilePath);
        
        return relativeSavePath + "/" + path;
    }
    
    public static List<String> uploadFile(UploadItem[] items, String relativeSavePath, HttpServletRequest request, ServletContext servletContext){
        List<String> filePaths = new ArrayList();
        for(UploadItem item : items){
            String filePath = uploadFile(item, relativeSavePath, request, servletContext);
            
            if(!filePath.isEmpty()){
                filePaths.add(filePath);
            }
        }
        return filePaths;
    }
    
    public List<FileItem> parseRequest(HttpServletRequest request, ServletContext servletContext)
            throws ServletException, IOException{
        try{
                // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Configure a repository (to ensure a secure temp location is used)
            //            ServletContext servletContext = this.getServletConfig().getServletContext(); as parameter in argument
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            return upload.parseRequest(request);
        } catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
