package com.cookandroid.a03_intent;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class SubActivity extends AppCompatActivity {


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub);
        Button btn2=(Button)findViewById(R.id.btn02);
        btn2.setOnClickListener(listener);
        TextView txtView=(TextView)findViewById(R.id.text2);
        // 이전 페이지에서 넘겨온 데이터를 key값을 받음..
        Intent intent = getIntent();
        String name = intent.getStringExtra("name");
        txtView.setText(name);
        Toast.makeText(getApplicationContext(),
                "입력한 이름:"+name, Toast.LENGTH_LONG).show();
    }

    View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            //자원 해제: 현재 객체 닫기
            finish();
        }
    };
}
