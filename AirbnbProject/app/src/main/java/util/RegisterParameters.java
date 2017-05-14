package util;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by sissy on 1/5/2017.
 */

public class RegisterParameters {

    //private static final String REGISTER_REQUEST_URL = "http://192.168.1.6:8080/ecommerce_restful/webresources/users";
    private Map<String, String> RegisterParameters;

    public RegisterParameters(String firstname, String lastname, String phonenumber, String email, String username, String password){

        RegisterParameters = new HashMap<>();
        RegisterParameters.put("firstName", firstname);
        RegisterParameters.put("last_name", lastname);
        RegisterParameters.put("phone_number", phonenumber);
        RegisterParameters.put("email", email);
        RegisterParameters.put("username", username);
        RegisterParameters.put("password", password);
        RegisterParameters.put("country", "greece");
        RegisterParameters.put("city", "athens");
        RegisterParameters.put("photo", "photo");
        RegisterParameters.put("about", "about");
        RegisterParameters.put("birth_date", "1990-08-05");
        RegisterParameters.put("host", "0");
    }


    public String getRegisterParameters() {
        JSONObject jsonparams = new JSONObject(RegisterParameters);
        return jsonparams.toString();
    }
}
