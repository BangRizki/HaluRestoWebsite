<html>

<head>
    <title>Form Register</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link href="assets/css/regis.css" rel="stylesheet">
</head>

<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Form Register
            </div>
            <div class="card-body">

                <form method="post">
                    <div class=" form-group">
                        <label for="nama">Nama</label>
                        <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama">
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="Masukkan Username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="email">E-mail</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Masukan E-mail Anda">
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary">Register</button>
                </form>
                <?php
                require_once 'proses_regis.php';
                ?>
            </div>
        </div>
    </div>
</body>

</html>