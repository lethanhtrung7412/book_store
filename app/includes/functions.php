<?php 
#Split date and time
function split_time($date){
	$new = explode(" ", $date);
	$new = $new[0];

	$new = date("d-m-Y", strtotime($new));
	return $new;
}

// DETELE
function delete_data($table, $field, $val){
	global $conn;
	$sql = mysqli_query($conn, "DELETE FROM {$table} WHERE $field = {$val}");
	if ($sql) return true;
	return mysqli_error($conn);
}