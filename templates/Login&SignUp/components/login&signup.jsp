<!-- 
  File Location: /CS5054NT_Advanced_Programming_and_Technologies/src/main/webapp/login&signup.jsp
   -->
  
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <script
        src="https://kit.fontawesome.com/64d58efce2.js"
      ></script>
      <link rel="stylesheet" href="styles/style.css" />
      <title>Sign in & Sign up Form</title>
    </head>
    <body>
      <div class="container">
        <div class="forms-container">
          <div class="signin-signup">
            <form method="post" action="UserLogin" class="sign-in-form">
              <h2 class="title">Sign in</h2>
              <div class="input-field">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Email" name="EmailLogin"/>
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="PasswordLogin"/>
              </div>
              <input type="submit" value="Login" class="btn solid" />
              <p class="social-text">Or Sign in with social platforms</p>
              <div class="social-media">
                <a href="#" class="social-icon">
                  <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-google"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </div>
            </form>
            <form method="post" action="UserRegistration" class="sign-up-form">
              <h2 class="title">Sign up</h2>
              <div class="input-field">
                <i class="fas fa-envelope"></i>
                <input type="email" placeholder="Email" name="EmailSignUp"/>
              </div>
              <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="UsernameSignUp"/>
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="PasswordSignUp"/>
              </div>
              <input type="submit" class="btn" value="Sign up" name="signup"/>
              <p class="social-text">Or Sign up with social platforms</p>
              <div class="social-media">
                <a href="#" class="social-icon">
                  <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-google"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </div>
            </form>
          </div>
        </div>
  
        <div class="panels-container">
          <div class="panel left-panel">
            <div class="content">
              <h3>New here ?</h3>
              <p>
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                ex ratione. Aliquid!
              </p>
              <button class="btn transparent" id="sign-up-btn">
                Sign up
              </button>
            </div>
            <img src="images/log.png" class="image" alt="" />
          </div>
          <div class="panel right-panel">
            <div class="content">
              <h3>One of us ?</h3>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                laboriosam ad deleniti.
              </p>
              <button class="btn transparent" id="sign-in-btn">
                Sign in
              </button>
            </div>
            <img src="images/register.png" class="image" alt="" />
          </div>
        </div>
      </div>
  
      <script src="scripts/app.js"></script>
    </body>
  </html>
  