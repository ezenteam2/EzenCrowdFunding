package com.example.ezenfunding;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class user_m_kb_RegistQnA extends AppCompatActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_m_kb_registqna);

        Button registQnA = (Button)findViewById(R.id.RegistQnA);
        registQnA.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent regQna = new Intent(getApplicationContext(), user_m_kb_qnaboard.class);
                startActivity(regQna);
                finish();
            }
        });
    }
}
