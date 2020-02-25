package com.example.ezenfunding;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class user_w_kb_QnAContent extends AppCompatActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_m_kb_qnacontent);

        Button moveBoards = (Button)findViewById(R.id.moveQnABtn);
        moveBoards.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent moveQnAIntent = new Intent(getApplicationContext(), user_m_kb_qnaboard.class);
                startActivity(moveQnAIntent);
                finish();
            }
        });

    }
}
