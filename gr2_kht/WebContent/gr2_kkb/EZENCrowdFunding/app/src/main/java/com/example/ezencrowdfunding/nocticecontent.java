package com.example.ezencrowdfunding;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class nocticecontent extends AppCompatActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_w_kb_nocticecontent);

        Button moveListBtn = (Button)findViewById(R.id.moveBoard);
        moveListBtn.setOnClickListener(bclick);
    }

    View.OnClickListener bclick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent intent = new Intent(getApplicationContext(), MainActivity.class);
            startActivity(intent);
            finish();
        }
    };
}
