<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
        <title>Formulario alta</title>
        <script type="text/javascript">
            $().ready(function () {
                jQuery.validator.addMethod('selectcheck', function (value) {
                    return (value != '0');
                }, "Campo obligatorio");

                $("#formulario_alta").validate({
                    rules: {
                        nombre: {
                            required: true,
                            minlength: 3,
                            maxlength: 20
                        },
                        apellido: {
                            required: true,
                            minlength: 3,
                            maxlength: 20
                        },
                        fecha_nacimiento: { 
                            required: true, 
                            dpDate: true 
                        },
                        nacionalidad: {
                            selectcheck: true
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Campo obligatorio",
                            minlength: "Longitud minima 3 car�cteres",
                            maxlength: "Longitud maxima 20 car�cteres"
                        },
                        apellido: {
                            required: "Campo obligatorio",
                            minlength: "Longitud minima 3 car�cteres",
                            maxlength: "Longitud maxima 20 car�cteres"
                        },
                        fecha_nacimiento: { 
                            required: "Campo obligatorio"
                        }
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row-flow">
                <form class="form-horizontal" method="POST" action="AltaFomulario" id="formulario_alta">
                    <p></p>
                    <div class="col-md-12">
                        <div class="panel panel-success">

                            <div class="panel-body">Formulario de Alta</div>

                            <div class="panel-footer">
                                <ul class="list-group">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="nombre">Nombre </label>
                                        <div class="col-sm-4"> <input class="form-control" name="nombre" type="text" > </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="apellido">Apellido </label>
                                        <div class="col-sm-4"> <input class="form-control" name="apellido" type="text"> </div>
                                    </div>                            

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="fecha_nacimiento">Fecha de Nacimiento </label>
                                        <div class="col-sm-4"><input  class="form-control" name="fecha_nacimiento" type="date"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="nacionalidad">Nacionalidad </label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="nacionalidad">
                                                <option value="0">nacionalidad</option>
                                                <!--<option selected></option>-->
                                                 <c:forEach var="fila" items="${nacionalidades}" >
                                                <option value="<c:out value="${fila['id']}"/>"><c:out value="${fila['descripcion']}"/></option>
                                                 </c:forEach>>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-4">
                                            <button class="btn btn-default" type="submit">Guardar</button>

                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">Cancelar</button>

                                             <!-- Modal -->
                                             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                               <div class="modal-dialog" role="document">
                                                 <div class="modal-content">
                                                   <div class="modal-header">
                                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                     <h4 class="modal-title" id="myModalLabel">Cancelar creacion de cliente</h4>
                                                   </div>
                                                   <div class="modal-body">
                                                       Se perderan todos los datos completados<br/>�Esta seguro de continuar?
                                                   </div>
                                                   <div class="modal-footer">
                                                     <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                     <a href="index" class="btn btn-danger">Continuar</a>
                                                   </div>
                                                 </div>
                                               </div>
                                             </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${not empty errores}"><!-- muestro errores-->
                                            <div class="alert alert-success">
                                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                <strong>Error al prosesar el formulario</strong>
                                                <ul>
                                                    <c:forEach var="fila" items="${errores}" >
                                                        <li><c:out value="${fila.value}"/></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </div>
                                </ul>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
