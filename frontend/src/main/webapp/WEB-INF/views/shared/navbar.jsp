    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    
      <div class="container">
        <a class="navbar-brand" style = "color:red"  href="${contextRoot}/home">Caf� Tulip</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive"  >
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active" id = "home">
              <a class="nav-link"  href="${contextRoot}/home">Home
                <span class="sr-only">home</span>
              </a>
            </li>
            <li class="nav-item" id = "about" >
              <a class="nav-link" href="${contextRoot}/about" >About</a>
            </li>
        
            <li class="nav-item" id = "contact">
              <a class="nav-link" href="${contextRoot}/contact">Contact</a>
            </li>
            
            <li class="nav-item" id = "listProducts">
              <a class="nav-link" href="${contextRoot}/show/all/products">View Products</a>
            </li>
            
              <li class="nav-item" id = "manageProducts">
              <a class="nav-link" href="${contextRoot}/manage/products">Manage Products</a>
            </li>
            
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
              
              <li class="nav-item" id = "register">
                  <a class="nav-link" href="${contextRoot}/register">Sigh Up</a>
               </li>
               <li class="nav-item" id = "login">
                  <a class="nav-link" href="${contextRoot}/login">Login</a>
               </li>
          </ul>
        </div>
      </div>
    </nav>
