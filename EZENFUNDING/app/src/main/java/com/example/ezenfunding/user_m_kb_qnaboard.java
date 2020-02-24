package com.example.ezenfunding;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class user_m_kb_qnaboard extends AppCompatActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_w_kb_qnaboard);

        Button moveNoctice = (Button)findViewById(R.id.moveNoctice);
        Button moveRegistQna = (Button)findViewById(R.id.moveRegistQnA);

        moveNoctice.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), user_w_kb_nocticeboard.class);
                startActivity(intent);
                finish();
            }
        });
        moveRegistQna.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent moveRegistQnAintent = new Intent(getApplicationContext(), user_m_kb_RegistQnA.class);
                startActivity(moveRegistQnAintent);
                finish();
            }
        });
    }


}
