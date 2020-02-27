package com.example.project3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class mypage extends AppCompatActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.mypage);

        Button depositBtn = (Button)findViewById(R.id.depositBtn);
        depositBtn.setOnClickListener(deposit);
    }
    View.OnClickListener deposit = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent intent = new Intent(getApplicationContext(), user_m_ys_myaccount.class);
            startActivity(intent);
            finish();
        }
    };
}
