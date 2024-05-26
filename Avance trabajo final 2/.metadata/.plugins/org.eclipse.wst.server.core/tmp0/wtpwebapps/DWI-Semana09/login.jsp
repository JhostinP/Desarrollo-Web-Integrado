<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Intranet</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">	
  	
<style type="text/css">
	:root{
	  --main-bg:#0dcaf0;
	}
	
	.main-bg {
	  background: var(--main-bg) !important;
	}
	
	input:focus, button:focus {
	  border: 1px solid var(--main-bg) !important;
	  box-shadow: none !important;
	}
	
	.form-check-input:checked {
	  background-color: var(--main-bg) !important;
	  border-color: var(--main-bg) !important;
	}
	
	.card, .btn, input{
	  border-radius:0 !important;
	}

</style>
</head>
<body class="main-bg">
  <!-- Login Form -->
  <div class="container">
    <div class="row justify-content-center" style="margin-top: 50px;!important">
      <div class="col-lg-4 col-md-6 col-sm-6">
        <div class="card shadow">
          <div class="card-title text-center border-bottom">
            <h2 class="p-3">INTRANET</h2>
          </div>
          <div class="card-body">
            <form method="post" action="ServletUsuario?tipo=INICIAR">
              <div class="mb-4">
                <label for="username" class="form-label font-weight-bold">Username/Email</label>
                <input type="text" class="form-control" name="username" />
              </div>
              <div class="mb-4">
                <label for="password" class="form-label font-weight-bold">Password</label>
                <input type="password" class="form-control" name="password" />
              </div>
              <div class="d-grid">
                <button type="submit" class="btn text-light main-bg">Login</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  
  <!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.MENSAJE!=null}">
	<script>
			toastr.success("${sessionScope.MENSAJE}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- eliminar atributo de tipo sesión MENSAJE -->
<c:remove var="MENSAJE" scope="session"/>	

</body>

</html>










