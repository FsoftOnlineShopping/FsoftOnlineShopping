/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function renderAdminDashboard() {
    let numbers = document.querySelectorAll('.quick-status .number');
    let contents = document.querySelectorAll('.quick-status .content');
    let table_top_customers = document.querySelector('.table-top-customers');
    let table_latest_order = document.querySelector('.table-latest-order');
    let adminDashboardAPI = 'http://localhost:8080/FsoftOnlineShopping/admin-dashboard-api';
    fetch(adminDashboardAPI, {
        method: 'GET',
        headers: {'Content-Type': 'application'}
    })
            .then(function (response) {
                return response ? response.json() : null;
            })
            .then(function (response) {
                console.log(response);
                numbers[0].innerText = '+' + formatNumber(response.newUsers);
                numbers[1].innerText = '+' + formatNumber(response.newOrders);
                numbers[3].innerText = '$' + formatNumber(response.totalIncome);
                let top_customers = response.topCustomers.map((customer) => {
                    return `<tr>
                            <td>${customer.userFullname}</td>
                            <td>${customer.totalOrders}</td>
                            <td>$${formatNumber(customer.totalSpending)}</td>
                            </tr>`;
                });
                renderChart(response.incomeThisMonth, response.incomeLastMonth);
                table_top_customers.innerHTML = `
                    <tr>
                        <th>User</th>
                        <th>Total Orders</th>
                        <th>Total Spending</th>
                    </tr>
                ${top_customers.join('')}`;
                let lastest_order = response.latestOrders.map((order) => {
                    let html = `<tr>
                                <td>#${order.cartID}</td>
                                <td>${order.userName}</td>`;
                    if (order.totalPrice) {
                        html += `<td>$${order.totalPrice}</td>`;
                    } else {
                        html += `<td></td>`;
                    }
                    if (order.cartStatus === 0) {
                        html += `<td></td>
                             <td><span class="status pending">Pending</span></td>
                                </tr>`;
                    }
                    if (order.cartStatus === 1) {
                        html += `<td>${order.paymentDate}</td>
                             <td><span class="status paid">Paid</span></td>
                                </tr>`;
                    }
                    if (order.cartStatus === 2) {
                        html += `<td>${order.paymentDate}</td>
                             <td><span class="status shipping">Shipping</span></td>
                                </tr>`;
                    }
                    if (order.cartStatus === 3) {
                        html += `<td>${order.deliverDate}</td>
                             <td><span class="status refund">Refund</span></td>
                                </tr>`;
                    }
                    return html;
                });
                table_latest_order.innerHTML = `
                     <tr>
                        <th>Order ID</th>
                        <th>User</th>
                        <th>Total Price</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                ${lastest_order.join('')}`;
            })
            .catch(function (error) {
//                console.log(error);
//                processing.style.display = 'none';
//                form3.style.display = 'block';
//                formMessage3.innerText = `Something wrong. Can not reset your password.`;
//                formMessage3.classList.add('invalid');
                window.location.href = 'SignOut';
            })
}
function formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}
renderAdminDashboard();
function renderChart(incomeThisMonth, incomeLastMonth) {
    const labels = ['3', '6', '9', '12', '15', '18', '21', '24', '27', '30'];
    const data = {
        labels: labels,
        datasets: [{
                label: 'Income last Month',
                backgroundColor: '#28a428',
                cubicInterpolationMode: 'monotone',
                borderDash: [20, 5],
                borderColor: '#28a428',
                data: incomeLastMonth,
            },{
                label: 'Income this Month',
                backgroundColor: '#fd5631',
                borderColor: '#fd5631',
                cubicInterpolationMode: 'monotone',
                data: incomeThisMonth
            }]
    };
    const config = {
        type: 'line',
        data: data,
        options: {
            scales: {
                x: {
                    grid: {
                        display: false
                    }
                },
                y: {
                    grid: {
                        display: false
                    }
                }
            },
            plugins: {
                legend: {
                    labels: {
                        boxWidth: 10,
                        boxHeight: 10,
                        usePointStyle: true,
                        pointStyle: 'circle',
                    },
                }
            },

        }
    };
    const myChart = new Chart(
            document.getElementById('income-analysis'),
            config
    );
}
