package com.example.ezenfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class mypage extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.mypage);
        Button button5 = (Button)findViewById(R.id.button5);

        button5.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentbutton5 = new Intent(mypage.this,Page1.class);
                startActivity(intentbutton5);
            }
        });
    }
}
