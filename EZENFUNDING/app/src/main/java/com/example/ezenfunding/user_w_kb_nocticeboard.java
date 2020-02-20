package com.example.ezenfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TableRow;

public class user_w_kb_nocticeboard extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_w_kb_nocticeboard);
        TableRow moveContent = (TableRow)findViewById(R.id.moveContent);

        moveContent.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentimageView4 = new Intent(user_w_kb_nocticeboard.this,user_w_kb_nocticecontent.class);
                startActivity(intentimageView4);
                finish();
            }

        });
    }
}
