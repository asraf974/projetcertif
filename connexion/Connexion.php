<?php
session_start();
//connexion bdd

$bdd = New PDO('mysql:host=localhost;dbname=ateliers_cuisine;charset=utf8', 'root','',array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));


if(isset($_POST['form_connexion']))
{
    $mailconnect=htmlspecialchars($_POST['mailconnect']);
    $mdpconnect=sha1($_POST['mdpconnect']);
    if(!empty($mailconnect) AND !empty($mdpconnect))
    {
        $requser=$bdd->prepare("SELECT*FROM utilisateurs WHERE email=? AND mdp=?");
        $requser->execute(array($mailconnect,$mdpconnect));
        $userexist=$requser->rowCount();
            if($userexist == 1)
            {
                $userinfo=$requser->fetch();
                $_SESSION['id']=$userinfo['id'];
                $_SESSION['prenom']=$userinfo['prenom'];
                $_SESSION['email']=$userinfo['email'];
                header("Location: profil.php");
            }
            else {
                $erreur="Mauvais mail mdp";
            }
    }
    else
    {
        $erreur="Error";
    }
}
?>

<!DOCTYPE html>
<html lang="fr" class="h-100">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="connexion.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="js/ajoututil.js"/>
    <script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row centered-form">
                <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title-center">CONNEXION</h3>
                            
                            <form id="login-form" class="form" action="connexion.php" method="post">
                                <div class="panel-body">
                            
                                <div class="form-group">
                                    <input type="email" name="email" id="email" class="form-control input-sm" placeholder="adresse@gmail.com" required>
                                </div>
    
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Saisir mot de passe" required>
                                        </div>
                                    </div>
                                </div>
                                
                                <input type="submit" value="Valider" class="btn btn-primary btn-block">
                                <a class="btn btn-primary btn-block" href="home.html"role=button> Retour à l'accueil</a>
                            </form>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

