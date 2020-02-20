package com.example.ezenfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class user_m_ht_projects_list extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_m_ht_projects_list);
        ImageView imageView6 = (ImageView)findViewById(R.id.imageView6);

        imageView6.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentimageView6 = new Intent(user_m_ht_projects_list.this,user_m_ht_projects_detail.class);
                startActivity(intentimageView6);
                finish();
            }

        });
        ImageView imageView3 = (ImageView)findViewById(R.id.imageView3);

        imageView3.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentimageView3 = new Intent(user_m_ht_projects_list.this,user_m_ht_projects_detail.class);
                startActivity(intentimageView3);
                finish();
            }

        });
        ImageView imageView5 = (ImageView)findViewById(R.id.imageView5);

        imageView5.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentimageView5 = new Intent(user_m_ht_projects_list.this,user_m_ht_projects_detail.class);
                startActivity(intentimageView5);
                finish();
            }

        });
        ImageView imageView4 = (ImageView)findViewById(R.id.imageView4);

        imageView4.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentimageView4 = new Intent(user_m_ht_projects_list.this,user_m_ht_projects_detail.class);
                startActivity(intentimageView4);
                finish();
            }

        });
    }
}
