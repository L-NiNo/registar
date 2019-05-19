<?php
$postdata = file_get_contents("php://input");
$request = json_decode($postdata);
$email = $request->email;
$dob = $request->dob;
session_start();
$response = new \stdClass();
$response->error = null;
$response->messages = [];
$success = false;
header('Content-Type: application/json; charset=UTF-8');

$verify = "SELECT *
    FROM national AS n
    JOIN players AS p
    JOIN guardians AS g
    JOIN e_contacts AS e
    JOIN medical_info AS m
    JOIN reg_address AS r
    WHERE p.player_id = n.player_id
    AND p.player_id = g.player_id
    AND p.player_id = e.player_id
    AND p.player_id = m.player_id
    AND p.player_id = r.player_id
    AND p.dob = ?
    AND p.email = ?
    AND n.national_id = ?";
try {
    if ($_SESSION['ID']) {
        if (isset($email) || isset($dob)) {
            // if (!$email || !$dob) {
            // LOOK UP BY NATIONAL ID
            require "db/connect.php";
            $query = $mysqli->prepare($verify);
            $query->bind_param('ssi', $dob, $email, $_SESSION['ID']);
            $query->execute();
            $results = $query->get_result();
            $numrows = $results->num_rows;
            // No rows, new player
            if ($numrows == 0) {
                $response->data = null;
                throw new Exception('invalid');
            } else if ($numrows == 1) { // Single record found, returning registrant  (expected)
                // $data = ;
                $response->data = processData($results->fetch_assoc());

            } else { // Multi records --> should not happen
                $array = [];
                while ($row = $results->fetch_assoc()) {
                    array_push($array, $row);
                }
                $response->data = $array;
            }
            $success = true;
        } else {
            throw new Exception('invalid Request');
        }
    } else {
        throw new Exception('not authotized');
    }
} catch (Exception $e) {
    $response->error = $e->getMessage();
    $response->code = 500;
    header('HTTP/1.1 500 Internal Server Error');
    die(json_encode($response));
} finally {
    array_push($response->messages, ($success) ? 'success: true' : 'success: false');
    echo json_encode($response);
}

function processData($data)
{
    $data = getPlayerInfo($data);
    $data = getAddressInfo($data);
    $data = getEmergencyInfo($data);
    $data = getGuargianInfo($data);
    $data = getMedicalInfo($data);

    return $data;
}

function getEmergencyInfo($data)
{
    $emergency = new \stdClass();
    if ($data["ec1_name"] || $data["ec1_num"] || $data["ec1_relationship"]) {
        $emergency->primary = new \stdClass();
        $emergency->primary->name = $data["ec1_name"];
        unset($data['ec1_name']);
        $emergency->primary->phone = $data["ec1_num"];
        unset($data['ec1_num']);
        $emergency->primary->relationship = $data["ec1_relationship"];
        unset($data['ec1_relationship']);
    }

    if ($data["ec2_name"] || $data["ec2_num"] || $data["ec2_relationship"]) {
        $emergency->secondary = new \stdClass();
        $emergency->secondary->name = ($data["ec2_name"]) ? $data["ec2_name"] : "";
        if ($data["ec2_name"]) {
            unset($data['ec2_name']);
        }
        ;
        $emergency->secondary->phone = ($data["ec2_num"]) ? $data["ec2_num"] : "";
        if ($data["ec2_num"]) {
            unset($data['ec2_num']);
        }
        ;
        $emergency->secondary->relationship = ($data["ec2_relationship"]) ? $data["ec2_relationship"] : "";
        if ($data["ec2_relationship"]) {
            unset($data['ec2_relationship']);
        }
        ;
    }
    $data['emergency'] = $emergency;
    return $data;
}

function getGuargianInfo($data)
{
    $guardian = new \stdClass();
    if ($data["g1_name"] || $data["g1_email"] || $data["g1_phone"]) {
        $guardian->primary = new \stdClass();
        $guardian->primary->name = $data["g1_name"];
        unset($data['g1_name']);

        $guardian->primary->email = $data["g1_email"];
        unset($data['g1_email']);

        $guardian->primary->phone = $data["g1_phone"];
        unset($data['g1_phone']);
    }

    if ($data["g2_name"] || $data["g2_email"] || $data["g2_phone"]) {
        $guardian->secondary = new \stdClass();
        $guardian->secondary->name = ($data["g2_name"]) ? $data["g2_name"] : "";
        unset($data['g2_name']);

        $guardian->secondary->email = ($data["g2_email"]) ? $data["g2_email"] : "";
        unset($data['g2_email']);

        $guardian->secondary->phone = ($data["g2_phone"]) ? $data["g2_phone"] : "";
        unset($data['g2_phone']);

    }
    $data['guardian'] = $guardian;
    return $data;
}
function getMedicalInfo($data)
{
    $medical = new \stdClass();
    $medical->med_id = $data["med_id"];
    unset($data['med_id']);

    $medical->physician = $data["physician"];
    unset($data['physician']);

    $medical->physicianNum = $data["dr_phone"];
    unset($data['dr_phone']);

    $medical->insurance = $data["insurance"];
    unset($data['insurance']);

    $medical->policy = $data["policy_num"];
    unset($data['policy_num']);

    $medical->callNum = $data["insurance_num"];
    unset($data['insurance_num']);

    $medical->allergies = $data["allergies"];
    unset($data['allergies']);

    $medical->conditions = $data["other"];
    unset($data['other']);

    $medical->medications = $data["medications"];
    unset($data['medications']);

    $data['medical'] = $medical;
    return $data;
}
function getAddressInfo($data)
{
    $address = new \stdClass();
    $address->street1 = $data["address"];
    unset($data['address']);

    $address->street2 = $data["address_2"];
    unset($data['address_2']);

    $address->city = $data["city"];
    unset($data['city']);

    $address->state = $data["st"];
    unset($data['st']);

    $address->zip = $data["zip"];
    unset($data['zip']);

    $data['address'] = $address;
    return $data;
}
function getPlayerInfo($data)
{
    $data['nationalId'] = $data["national_id"];
    unset($data['national_id']);

    $date['id'] = $data["player_id"];
    unset($data['player_id']);

    $dob = new \stdClass();
    $dob->day = explode('.', $data["dob"])[1];
    $dob->month = explode('.', $data["dob"])[0];
    $dob->year = explode('.', $data["dob"])[2];
    $dob->birthday = str_replace('.', '/', $data["dob"]);
    $data["dob"] = $dob;

    $data['grade'] = $data["current_grade"] + 1;
    unset($data['current_grade']);

    $data['shorts'] = $data["short_size"];
    unset($data['short_size']);

    $data['shirt'] = $data["shirt_size"];
    unset($data['shirt_size']);

    return $data;
}
