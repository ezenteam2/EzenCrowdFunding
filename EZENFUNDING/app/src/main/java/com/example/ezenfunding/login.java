package com.example.ezenfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class login extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);
        Button loginBtn = (Button) findViewById(R.id.loginBtn);

        loginBtn.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentloginBtn = new Intent(login.this,mypage.class);
                startActivity(intentloginBtn);
            }
        });
    }

}
