<jsp:include page="intranet.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mantenimiento Docente</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css" rel="stylesheet">
<style >
.modal-header{
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;
  		
	}
	.help-block {
	  		color: red;
	}
	.form-group.has-error .form-control-label {
	  color: red;
	}
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}

</style>

</head>
<body>

<div class="container">
  <h1 class="mt-5 text-center">Listado de Docentes</h1>
  
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" 
	data-bs-toggle="modal" data-bs-target="#exampleModal">Nuevo Docente</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Docente</h1>
      </div>
      <div class="modal-body">
        
      <form id="formDocente" method="post" action="ServletDocente?accion=grabar">
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Código</label>
		    <input type="text" class="form-control" name="codigo" id="id-codigo" value="0" readonly>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Nombre</label>
		    <input type="text" class="form-control" name="nombre" id="id-nombre">
		  </div>
  
		  <div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Paterno</label>
		    <input type="text" class="form-control" name="paterno" id="id-paterno">
		  </div>
  
		  <div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Materno</label>
		    <input type="text" class="form-control" name="materno" id="id-materno">
		  </div>
  
	    <div class="form-group">
	    <label for="exampleInputPassword1" class="form-label">Hijos</label>
	    <input type="text" class="form-control" name="hijos" id="id-hijos">
	  	</div>
  
    <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Sueldo</label>
    <input type="text" class="form-control" name="sueldo" id="id-sueldo">
  </div>
  
    <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Sexo</label>
    <select class="form-select" name="sexo" id="id-sexo">
	  <option value="" selected>[Seleccionar sexo]</option>
	  <option value="Masculino">Masculino</option>
	  <option value="Femenino">Femenino</option>
	</select>
  </div>
  	<div class="form-group">
		<label for="exampleInputPassword1" class="form-label">Colegio</label>
		<select class="form-select" name="colegio" id="id-colegio">
			<option value=" ">[Seleccione colegio]</option>
			
		</select>
	</div>
  
  
  
  
		<div class="modal-footer">
              <button type="submit" class="btn btn-primary">Grabar</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btn-cerrar">Cerrar</button>
      	</div>

	</form>  
        
      </div>
      
    </div>
  </div>
</div>
  
  <div class="mt-3">
  <table id="TableDocente" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombres</th>
                <th>Paterno</th>
                <th>Materno</th>
                <th>Sexo</th>
                <th>Hijos</th>
                <th>Sueldo</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
          <!-- 
        	<c:forEach items="${requestScope.docentes}" var="row">
	            <tr>
	                <td>${row.codigo}</td>
	                <td>${row.nombre}</td>
	                <td>${row.paterno}</td>
	                <td>${row.materno}</td>
	                <td>${row.sexo}</td>
	                <td>${row.hijos}</td>
	                <td>${row.sueldo}</td>
	                <td><button type="button" class="btn btn-success btn-editar" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar</button></td>
	                <td><button type="button" class="btn btn-danger btn-eliminar">Eliminar</button></td>
	            </tr>
            </c:forEach>
             -->
        </tbody>
    </table>
  </div>
  
</div>


</body>

<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- libreria JS de bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- libreria JS de la tabla -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- libreria para validar (bootstrap validator) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

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

	<script>
		
		//invocar funciones de carga
		cargarColegios();
		cargarDocentes()
		
		//crear función para leer JSON
		function cargarColegios(){
			$.get("ServletColegioJSON",function(response){	
				//bucle each "for"
				$.each(response,function(index,item){
					//llenar combo
					$("#id-colegio").append("<option value='"+item.codigo+"'>"+item.nombre+"</option>");
				})
			})
		}
		//crear función para leer JSON de docentes
		function cargarDocentes(){
			$.get("ServletDocenteJSON",function(response){	
				let botonEditar="<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
                let botonEliminar="<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
				$.each(response,function(index,item){
					//llenar tabla
					$("#TableDocente").append("<tr><td>"+item.codigo+"</td>"+
						 "<td>"+item.nombre+"</td>"+"<td>"+item.paterno+"</td>"+
						 "<td>"+item.materno+"</td>"+"<td>"+item.sexo+"</td>"+
						 "<td>"+item.hijos+"</td>"+"<td>"+item.sueldo+"</td>"+
						 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
				})
				new DataTable('#TableDocente');
			})
		}
		
		
		
		//asignar evento click a todos los botones con nombre de clase btn-editar
		$(document).on("click",".btn-editar",function(){
			var cod;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			$.get("ServletFindDocenteJSON?codigo="+cod, function(response){
				//console.log(response);
				//mostrar valores en las cajas
				$("#id-codigo").val(response.codigo);
				$("#id-nombre").val(response.nombre);
				$("#id-paterno").val(response.paterno);
				$("#id-materno").val(response.materno);
				$("#id-hijos").val(response.hijos);
				$("#id-sueldo").val(response.sueldo);
				$("#id-sexo").val(response.sexo);
				$("#id-colegio").val(response.codigoColegio);
			})
		})
		//asignar evento click a todos los botones con nombre de clase btn-eliminar
		$(document).on("click",".btn-eliminar",function(){
			var cod;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			Swal.fire({
				  title: 'Seguro de eliminar?',
				  text: "Docente con ID: "+cod,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Aceptar',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    window.location="http://localhost:8080/DWI-Semana06/ServletDocente?accion=eliminar&codigo="+cod;
				  }
				})			
		})
		
		//asignar evento click al botón con ID "btn-cerrar"
		$(document).on("click","#btn-cerrar",function(){
			//resetear formulario
			$("#formDocente").trigger("reset");
			//resetar validación
			$("#formDocente").data("bootstrapValidator").resetForm(true);
			//
			$("#id-codigo").val("0");
		})
	</script>

<script>    
    $(document).ready(function(){     
        $('#formDocente').bootstrapValidator({      
        	 fields:{
        		 	nombre:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo nombre es obligatorio'
        		 			},
        		 			regexp:{
        		 				regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
        		 				message:'Campo nombre valores errores(Letras,espacio, vocales con tilde y .)'
        		 			}
        		 		}
        		 	},
        		 	paterno:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo paterno es obligatorio'
        		 			}
        		 		}
        		 	},
        		 	materno:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo materno es obligatorio'
        		 			}
        		 		}
        		 	},
        		 	sexo:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Seleccione sexo'
        		 			}
        		 		}
        		 	},
        		 	sueldo:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo sueldo es obligatorio'
        		 			}
        		 		}
        		 	},
        		 	hijos:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo hijos es obligatorio'
        		 			},
        		 			between:{
        		 				min:0,
        		 				max:10,
        		 				message:'Campo hijos solo números rango 0 - 10'
        		 			}
        		 			
        		 		}
        		 	}
        		 
        	 }
        });   
			
    });    
</script>   





</html>