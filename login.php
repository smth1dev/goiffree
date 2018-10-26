<?php

//login.php

include('config.php');

session_start();

$form_data = json_decode(file_get_contents("php://input"));

$validation_error = '';

if(empty($form_data->username))
{
 $error[] = 'Username is required';
}
else
{
$data[':username']=$form_data->username;
}

if(empty($form_data->password))
{
 $error[] = 'Password is Required';
}

if(empty($error))
{
 $query = "
 SELECT * FROM store 
 WHERE store_username = :username
 ";
 $statement = $connect->prepare($query);
 if($statement->execute($data))
 {
  $result = $statement->fetchAll();
  if($statement->rowCount() > 0)
  {
   foreach($result as $row)
   {
    if(password_verify($form_data->password, $row["store_password"]))
    {
     $_SESSION["username"] = $row["store_username"];
     $_SESSION["store_id"] = $row["store_id"];
     $success=true;
    }
    else
    {
     $validation_error = 'Wrong Password';
    }
   }
  }
  else
  {
   $validation_error = 'Wrong Email';
  }
 }
}
else
{
 $validation_error = implode(", ", $error);
}

$output = array(
 'error' => $validation_error
);
if($validation_error=''){
  header("location:dashboard.php");
}
echo json_encode($output);

?>
