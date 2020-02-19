package com.example.ezencrowdfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TableRow;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_w_kb_nocticeboard);

        TableRow tr = (TableRow)findViewById(R.id.moveContent);
        tr.setOnClickListener(tclick);
    }

    View.OnClickListener tclick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent intent = new Intent(getApplicationContext(),nocticecontent.class);
            startActivity(intent);
            finish();
        }
    };
}
