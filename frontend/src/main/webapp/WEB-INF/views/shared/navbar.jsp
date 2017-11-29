    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    
      <div class="container">
        <a class="navbar-brand" style = "color:red"  href="${contextRoot}/home">Café Tulip</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
   <div class="collapse navbar-collapse" id="navbarResponsive"  >
          <ul class="navbar-nav navbar-left">
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
   
     </div>
      <div  id="navbarResponsive"  >
          <ul class="nav navbar-nav ">
        
              
              <li class="nav-item" id = "register">
                  <a class="nav-link" href="${contextRoot}/register">Sigh Up</a>
               </li>
               
               <li class="nav-item" id = "login">
                  <a class="nav-link" href="${contextRoot}/login">Login</a>
               </li>
               
           
               <li  class="dropdown ">
                    <a href="javascript:void(O)"
                         class="btn btn-default dropdown-toggle"
                         id="dropdownMenu1"
                         data-toggle="dropdown">
                          
                          ${userModel.fullName }
                           <span class="caret"></span>
                         
                      </a>   
                      <ul class="dropdown-menu">
                          <li >
                              <a href="${contextRoot}/cart">
                                     <span class="glyphicon glyphicon-shopping-cart"></span>
                                     <span class="badge">${userModel.cart.cartLines}</span>
                                     - Lei  ${userModel.cart.grandTotal}
                              </a>
                          </li>
                          <li  class="dropdown-divider" role="separator"></li> <!-- separatorul -->
                          <li>
                              <a href="${contextRoot}/logout">Logout</a>                          
                          </li>
                          
                         
                      </ul>
               </li>
               
          </ul>
       </div>  <!-- care am adaugat -->
         <!-- lam pus mai sus -->
        
        <!--  -->
      </div>
    </nav>
