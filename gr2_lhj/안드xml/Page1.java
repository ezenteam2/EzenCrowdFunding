package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Page1 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.page1);

        Button btn01 = (Button) findViewById(R.id.nextPage);
        btn01.setOnClickListener(nextPage);
    }

    View.OnClickListener nextPage = new View.OnClickListener(){

        @Override
        public void onClick(View v){
            Intent intent0 = new Intent(getApplicationContext(), Page2.class);

            startActivity(intent0);
        }
    };
}
