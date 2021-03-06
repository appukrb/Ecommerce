package gr.uoa.di.airbnbproject;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.ArrayList;

import util.RestCallManager;
import util.RestCallParameters;
import util.RestPaths;

/**
 * Created by sissy on 30/4/2017.
 */

public class LoginActivity extends AppCompatActivity {

    Context c;

    private static final String USER_LOGIN_PREFERENCES = "login_preferences";
    SharedPreferences sharedPrefs;
    SharedPreferences.Editor editor;
    private boolean isUserLoggedIn;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Set View to activity_login.xml

        setContentView(R.layout.activity_login);

        c=this;

        sharedPrefs = getApplicationContext().getSharedPreferences(USER_LOGIN_PREFERENCES, Context.MODE_PRIVATE);

        //get user input
        final EditText etUsername = (EditText) findViewById(R.id.etUsername);
        final EditText etPassword = (EditText) findViewById(R.id.etPassword);
        final Button blogin = (Button) findViewById(R.id.login);
        final TextView registerlink = (TextView) findViewById(R.id.registerlink);

        //if user does not have an account, presses on the Register Here and the Register Screen appears
        registerlink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent registerintent = new Intent(LoginActivity.this, RegisterActivity.class);
                LoginActivity.this.startActivity(registerintent);
            }
        });

        blogin.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                final String Username = etUsername.getText().toString();
                final String password = etPassword.getText().toString();

                boolean userExists = true;

                if(Username.length() == 0 || password.length() == 0)
                {
                    //if something is not filled in, user must fill again the form
                    Toast.makeText(c, "Please fill in all fields!", Toast.LENGTH_SHORT).show();
                    return;
                }

                //check if the user is correct
                String loginurl = RestPaths.getLoginUser(Username, password);

                RestCallManager loginManager = new RestCallManager();
                RestCallParameters loginParameters = new RestCallParameters(loginurl, "GET", "JSON", "");
                loginManager.execute(loginParameters);

                ArrayList<JSONObject> jsonArrayLogin = loginManager.getSingleJSONArray();
                if(jsonArrayLogin.size() == 0) userExists = false;


                if(userExists){
                    Toast.makeText(c, "User does not exist, please click on Register to create a new account", Toast.LENGTH_SHORT).show();
                    return;
                }
                else{

                    isUserLoggedIn = sharedPrefs.getBoolean("userLoggedInState", false);
                    editor = sharedPrefs.edit();
                    editor.putBoolean("userLoggedInState", true);
                    editor.putString("currentLoggedInUser", Username);
                    editor.commit();

                    Intent homeintent = new Intent(LoginActivity.this, HomeActivity.class);
                    try {
                        LoginActivity.this.startActivity(homeintent);
                    } catch (Exception ex) {
                        System.out.println(ex.getMessage());
                        ex.printStackTrace();
                    }
                }
            }
        });
    }

    @Override
    public void onBackPressed() {
        isUserLoggedIn = sharedPrefs.getBoolean("userLoggedInState", false);
        if (isUserLoggedIn) {
            Intent intent = new Intent(this, HomeActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
            super.onBackPressed();
            return;
        }
        else {
            Intent greetingIntent = new Intent(this, GreetingActivity.class);
            startActivity(greetingIntent);
            super.onBackPressed();
        }
    }
}
