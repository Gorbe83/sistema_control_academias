<%-- 
    Document   : loging
    Created on : 30/11/2015, 08:07:33 PM
    Author     : Gerardo
--%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="initial-scale=1.0, width=device-width" name="viewport">
    <title>Login</title>

    <!-- css -->
    <link href="css/base.min.css" rel="stylesheet">

    <!-- css for this project -->
    <link href="css/project.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    
     <% if("true".equals((String)request.getParameter("registro"))) { %>
        <script type="text/javascript">
            alert("Miembro agregado satisfactoriamente");
        </script>
    <% }
    else if("false".equals((String)request.getParameter("registro"))) { %>
        <script type="text/javascript">
            alert("No se pudo agregar al miembro");
        </script>
        <% } %>

    <!-- favicon -->
    <!-- ... -->

    <!-- ie -->
            <!--[if lt IE 9]>
                    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
</head>
<body class="avoid-fout page-brand">
    <div class="avoid-fout-indicator avoid-fout-indicator-fixed">
            <div class="progress-circular progress-circular-center">
                    <div class="progress-circular-wrapper">
                            <div class="progress-circular-inner">
                                    <div class="progress-circular-left">
                                            <div class="progress-circular-spinner"></div>
                                    </div>
                                    <div class="progress-circular-gap"></div>
                                    <div class="progress-circular-right">
                                            <div class="progress-circular-spinner"></div>
                                    </div>
                            </div>
                    </div>
            </div>
    </div>
    <header class="header header-brand">
            <span class="header-logo">SISCOAC</span>
    </header>
    <div class="content">
            <div class="container">
                    <div class="row">
                            <div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
                                    <section class="content-inner">
                                            <div class="card-wrap">
                                                    <div class="card">
                                                            <div class="card-main">
                                                                    <div class="card-header">
                                                                            <div class="card-inner">
                                                                                    <h1 class="card-heading">Inicio de Sesión</h1>
                                                                            </div>
                                                                    </div>
                                                                    <div class="card-inner">
                                                                            <form class="form" action="comprobarLogIn.jsp" method="post">
                                                                                    <div class="form-group form-group-label">
                                                                                            <div class="row">
                                                                                                    <div class="col-md-10 col-md-push-1">
                                                                                                            <label class="floating-label" for="login-username">Correo electrónico</label>
                                                                                                            <input class="form-control" id="login-username" type="email" name="email" required>
                                                                                                    </div>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="form-group form-group-label">
                                                                                            <div class="row">
                                                                                                    <div class="col-md-10 col-md-push-1">
                                                                                                            <label class="floating-label" for="login-password">Contraseña</label>
                                                                                                            <input class="form-control" id="login-password" type="password" name="password" required>
                                                                                                    </div>
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                            <div class="row">
                                                                                                    <div class="col-md-10 col-md-push-1">
                                                                                                            <button type="submit" class="btn btn-block waves-attach waves-button" onclick="this.form.password.value = MD5(this.form.password.value)">Entrar</button>
                                                                                                    </div>
                                                                                            </div>
                                                                                    </div>
                                                                            </form>
                                                                    </div>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="clearfix">
                                                    <p style="text-align: center;" class="margin-no-top pull-none"><a class="btn btn-flat btn-blue waves-attach" data-toggle="modal" href="#modal">Crea una cuenta</a></p>
                                            </div>
                                    </section>
                            </div>
                    </div>
            </div>
    </div>
    
    <div aria-hidden="true" class="modal fade" id="modal" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-xs">
                    <div class="modal-content">
                            <div class="modal-heading">
                                    <a class="modal-close" data-dismiss="modal">&times;</a>
                                    <h2 class="modal-title">Crear cuenta</h2>
                            </div>
                            <form action="guarda-miembro.jsp" method="POST" class="form">
                            <div class="modal-inner">
                                            <div class="form-group form-group-label">
                                                    <div class="row">
                                                            <div class="col-lg-10 col-sm-12">
                                                                    <label class="floating-label" for="nombre">Nombre</label>
                                                                    <input class="form-control" id="nombre" type="text" name="nombre" required>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="form-group form-group-label">
                                                    <div class="row">
                                                            <div class="col-lg-10 col-sm-12">
                                                                    <label class="floating-label" for="apellido_p">Apellido Paterno</label>
                                                                    <input class="form-control" id="apellido_p" type="text" name="apellido_p" required>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="form-group form-group-label">
                                                    <div class="row">
                                                            <div class="col-lg-10 col-sm-12">
                                                                    <label class="floating-label" for="apellido_m">Apellido Materno</label>
                                                                    <input class="form-control" id="apellido_m" type="text" name="apellido_m" required>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="form-group form-group-label">
                                                    <div class="row">
                                                            <div class="col-lg-10 col-sm-12">
                                                                    <label class="floating-label" for="email">Correo electrónico</label>
                                                                    <input class="form-control" id="email" type="email" name="email" required>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="form-group form-group-label">
                                                    <div class="row">
                                                            <div class="col-lg-10 col-sm-12">
                                                                    <label class="floating-label" for="contrasenia">Contraseña</label>
                                                                    <input class="form-control" id="contrasenia" type="password" name="contrasenia" required>
                                                            </div>
                                                    </div>
                                            </div>
                                </div>
                                <div class="modal-footer">
                                        <p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" type="button">Cerrar</button><button type="submit" class="btn btn-flat btn-brand waves-attach" onclick="this.form.contrasenia.value = MD5(this.form.contrasenia.value)">Crear cuenta</button></p>
                                </div>
                        </form>
                    </div>
            </div>
    </div>

    <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/base.min.js"></script>
    <script src="js/MD5.js"></script>
    
    <!-- js for this project -->
    <script src="js/project.min.js"></script>
</body>
</html>