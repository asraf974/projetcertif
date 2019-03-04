<?php
session_start(); 

if(isset($_SESSION['id']) AND !empty($_SESSION['id']) ){
    $sessionid = intval($_SESSION['id']); 
    $bdd = new PDO('mysql:host=localhost;dbname=ateliers_cuisine;charset=utf8', 'root', '');
    
    if(isset($_GET['res'] )AND !empty($_GET['res'])){
    //reservation    
    }
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Liste Ateliers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body>
<nav>
  <ul>
  <li><a href="../utilisateurs/profil_particulier.php">Profil</a></li>
  <li><a href="liste_particulier.php">Voir la liste d'atelier</a></li>

  </ul>
  </nav> 

    <!-- Affichage liste sous forme de tableaux -->
    <table border="1">

            <tr>
                <th style="font-weight:bold">Titre</th>
                <th style="font-weight:bold">Description</th>
                <th style="font-weight:bold">Date</th>
                <th style="font-weight:bold">Horaire de début</th>
                <th style="font-weight:bold">Durée</th>
                <th style="font-weight:bold">Places Disponibles</th>
                <th style="font-weight:bold">Places Réservées</th>
                <th style="font-weight:bold">Prix</th>
            </tr>

            <!-- Connexion BDD, table ateliers -->
            
            <?php $reponse = $bdd -> query('SELECT * FROM ateliers');
            while ($donnees = $reponse -> fetch())
            { 
                if($donnees['actif'] == 1){
                    $donnees['actif'] = "s'inscrire";
            ?>

                <!-- Affichage en php des données -->
                <tr>
                    <td><?php echo $donnees['titre'];?></td>
                    <td><?php echo $donnees['descriptif'];?></td>
                    <td><?php echo $donnees['date_atelier'];?></td>
                    <td><?php echo $donnees['debut'];?></td>
                    <td><?php echo $donnees['duree'];?></td>
                    <td><?php echo $donnees['places_dispo'];?></td>
                    <td><?php echo $donnees['places_reserver'];?></td>
                    <td><?php echo $donnees['prix'];?></td>
                    <td><a href="liste_particulier.php?res=<?php echo $donnees['id'];?>"><?php echo $donnees['actif'];?></a></td>

                </tr>

          

            <?php 
                }
            } ?>

    </table>
       
</body>
</html>
<?php } ?>