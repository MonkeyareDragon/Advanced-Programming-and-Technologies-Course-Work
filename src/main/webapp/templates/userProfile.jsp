<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
    @charset "UTF-8";

body {
    background: linear-gradient (to right,
            #2ed573,
            #f92ac4);
    overflow-x: hidden;

}

.container {
    background: #fff;
    width: 540px;
    height: 350px;
    margin: auto;
    position: relative;
    margin-top: 10%;
    box-shadow: 2px 5px 20px rba(119, 119, 119, -5);
}

.leftbox {
    float: left;
    top: -5%;
    left: 5%;
    position: absolute;
    width: 15%;
    height: 120%;
    background: #2ed573;
    box-shadow: 3px 3px 18px rba(119, 119, 119, -5);
    border: -1em solid #fff;
}

nav a {
    list-style: none;
}

nav a.tab {
    padding: 35px 30px;
    color: #fff;
    font-size: 1.2em;
    display: block;
    transition: all .3s ease-in-out;
}


nav a:hover {
    color: #10ac84;
    cursor: pointer;
    transform: scale(1, 2);
}


nav a:first-child {
    margin-top: 7px;
}

nav a.active {
    color: #10ac84;

}

.rightbox {
    width: 60%;
    margin-left: 27%;
    height:100%;
}

.tabShow {
    transition: all .5s ease-in;
    width: 80%;
    position: absolute;
    overflow-y:scroll;
}

.tabShow .head img{
height:5rem;
width:5rem;
border-radius: 50%;
}

h1 {
    font-family: "Monstserrat", sans-serif;
    color: #7ed386;
    font-size: 1.2rem;
    margin-top: 40px;
    margin-bottom: 35px;
}

h2 {
    font-family: "Roboto", sans-serif;
    color: #777;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 8px;
    margin-left: 2px;
    margin-top: 10;
}

.input,
p {
    border: 0;
    border-bottom: 1px solid #3fb6a8;
    width: 80%;
    font-family: "montserrat", sans-serif;
    font-size: .7rem;
    padding: 7px 0;
    color: #070707;
    outline: none;
}

span {
    font-size: -7em;
    color: #777;
}

.btn {
    font-family: "roboto", sans-serif;
    text-transform: uppercase;
    font-size: 15px;
    border: 0;
    color: #fff;
    background: #7ed386;
    padding: 7px 15px;
    box-shadow: 0ps 2px 4px ops rgba((0, 0, 0, .2), green, blue, alpha);
    cursor: pointer;
    margin-top: 15px;
}

#update-password-box {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
  height: 300px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
  padding: 20px;
  box-sizing: border-box;
}
#update-password-box>form>div{
display:flex;
  flex-direction:column;
  justify-content:space-between;
}

#update-password-box>form .button{
margin: 80px 0 0 0;
display:flex;
flex-direction:row;
justify-content:space-between;
}



.tabShow {
    display: none;

}
h4{
margin:auto;
text-align:center;}
    </style>
</head>

<body>
<c:set var="user" value="${currentUser}"/>
<c:set var="pay" value="${userPayment}"/>
<h4>${sessionScope.updateInfoMessage}</h4>
    		<%request.getSession().removeAttribute("updateInfoMessage"); %>
    	<h4>${sessionScope.updatePasswordMessage}</h4>
    		<%request.getSession().removeAttribute("updatePasswordMessage"); %>
    		
    		<h4>${sessionScope.updatePaymentMessage}</h4>
    		<%request.getSession().removeAttribute("updatePaymentMessage"); %>

    <div class="container">
     
        <div class="leftbox">
            <nav>
                <a onclick="tabs[0].click()" href="#" class="tab active"><i class="fa fa-user"></i></a>
                <a onclick="tabs[1]" href="#" class="tab"><i class="fa fa-credit-card"></i></a>
                <a onclick="tabs[3]" href="#" class="tab"><i class="fa fa-shopping-basket"></i></a>
                <a onclick="tabs[4]" href="#" class="tab"><i class="fa fa-cog"></i></a>
            </nav>
        </div>
        <div class="rightbox">
            <form class="profile tabShow" action="${pageContext.request.contextPath}/update-info" method="post" enctype="multipart/form-data">
           
                <div class="head" style="display:flex; flex-direction: row; justify-content:flex-start; margin-bottom:20px;">
                    <div class="profilePhoto" style="display:flex; flex-direction: column;">
                        <img src="images/${user.getUserPhoto()}" alt="profile"
                            onerror="this.onerror=null;this.src='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/img/placeholder.svg';this.classList.add('fa','fa-user'); this.style.objectFit='contain';" />

                        
                            <input type="file" class="update-photo-btn" name="profilePhoto" value="update photo">                        
                        
                    </div>
                    
                </div>
<h1>Personal Info</h1>
                <label for="name">
                    <h2>Full Name</h2>
                </label>
                <input type="text" id="name" class="input" name="newName" value="${user.getFirstName()} ${user.getLastName()}">
                <label for="email">
                    <h2>Email</h2>
                </label>
                <input type="text" id="email" class="input" name="newEmail" value=${user.getEmail()}>
                <label for="gender">
                    <h2>Gender</h2>
                </label>
                <input type="text" id="gender" class="input" name="newGender" value="${user.getGender()}">
                <button class="btn">Update</button>
            </form>
            <form class="payment tabShow" action="${pageContext.request.contextPath}/update-payment" method="post" name="paymentForm" onsubmit="return validateForm()">
                <h1>Payment Info</h1>
                <label for="newPaymentMethod">
                    <h2>Payment Method</h2>
                </label>
                <input type="text" id="newPaymentMethod" class="input" value="${pay.getPaymentMethod()}" name="newPaymentMethod">
                <label for="newCardNo">
                    <h2>Card Number</h2>
                </label>
                <input type="text" id="newCardNo" class="input" value="${pay.getCardNo()}" name="newCardNo">
                <label for="newCVC">
                    <h2>CVC</h2>
                </label>
                <input type="text" id="newCVC" class="input" value="${pay.getCvcNo()}" name="newCVC">
                <label for="newExpiryDate">
                    <h2>Expiry Date</h2>
                </label>
                <input type="text" id="newExpiryDate" class="input" value="${pay.getExpirationDate()}" name="newExpiryDate">
                <button type="submit" class="btn">Update</button>
                <script>
			    function validateForm() {
			        var newPaymentMethod = document.forms["paymentForm"]["newPaymentMethod"].value;
			        var newCardNo = document.forms["paymentForm"]["newCardNo"].value;
			        var newCVC = document.forms["paymentForm"]["newCVC"].value;
			        var newExpiryDate = document.forms["paymentForm"]["newExpiryDate"].value;
			        
			        if (newPaymentMethod == "" || newCardNo == "" || newCVC == "" || newExpiryDate == "") {
			            alert("All fields are required");
			            return false;
			        }
			    }
				</script>
            </form>
            <div class="privacy tabShow">
                <h1>Privacy Settings</h1>

                <h2>Manage Email</h2>
                <p></p>
                <h2>View Terms of Use</h2>
                <p>personalized Ad Experience</p>
                <h2>Protect Account</h2>
                <button class="btn">Update</button>
            </div>
            <div class="settings tabShow">
            
                <h1>Account Settings</h1>

                <h2>Sync purchaseList</h2>

                <p></p>
                <h2>Cancel Subscription</h2>
                <p></p>
                <h2>Your Devices</h2>
                <p></p>
                <h2>Referrals</h2>
                <p></p>
                <button class="btn" id="update-password-btn">Update Password</button>
            </div>
        </div>
        <div id="update-password-box" style="display: none;">
  <h2>Update Password</h2>
  <form action="${pageContext.request.contextPath}/update-password" method="post">
    <div>
    <label for="current-password">Current Password:</label>
    <input type="password" id="current-password" name="currentPassword" required>
    
    </div>
    <div>
    <label for="new-password">New Password:</label>
    <input type="password" id="new-password" name="newPassword" required>
    </div>

    <div>
    <label for="confirm-password">Confirm New Password:</label>
    <input type="password" id="confirm-password" name="confirmPassword" required>
    </div>

    <div class="button">
    <button type="submit">Update Password</button>
    <script>
    if (!newPassword.equals(confirmPassword)) {
    	  alert("Current password is not equal to old password!");
    	}
    </script>
    <button type="button" id="cancel-btn">Cancel</button>
    </div>
  
  </form>
</div>
    </div>
    <script>
        const tabBtn = document.querySelectorAll(".tab");
        const tab = document.querySelectorAll(".tabShow");
        console.log(tab);
        function tabs(panelIndex) {
            tab.forEach(function (node) {
                node.style.display = "none";
            });
            tab[panelIndex].style.display = "block";
        }
        tabs(0);
    </script>
    <script>
        $(".tab").click(function () {
            console.log("hello");

            $(this).addClass("active").siblings().removeClass("active");
            tabs($(this).index());
        })


    </script>
    <script>
    const updatePasswordBtn = document.getElementById('update-password-btn');
    const cancelBtn = document.getElementById('cancel-btn');
    const updatePasswordBox = document.getElementById('update-password-box');

    updatePasswordBtn.addEventListener('click', () => {
      updatePasswordBox.style.display = 'block';
    });

    // to close the pop-up box when the user clicks outside of it
    window.addEventListener('click', (event) => {
      if (event.target === cancelBtn) {
        updatePasswordBox.style.display = 'none';
      }
    });
    </script>
    
</body>

</html>