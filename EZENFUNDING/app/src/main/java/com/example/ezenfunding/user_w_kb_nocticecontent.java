package com.example.ezenfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class user_w_kb_nocticecontent extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_w_kb_nocticecontent);

        Button moveBoard = (Button)findViewById(R.id.moveBoard);
        moveBoard.setOnClickListener(bclick);
    }

    View.OnClickListener bclick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent intent = new Intent(getApplicationContext(), user_w_kb_nocticeboard.class);
            startActivity(intent);
            finish();
        }
    };
}
