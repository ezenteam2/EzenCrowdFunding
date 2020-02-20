package com.example.ezenfunding;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button recommend = (Button)findViewById(R.id.recommend);

        recommend.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentrecommend = new Intent(MainActivity.this,user_m_ht_category_menu.class);
                startActivity(intentrecommend);
                finish();
            }

        });
        Button security = (Button)findViewById(R.id.security);

        security.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentsecurity = new Intent(MainActivity.this,user_m_ht_category_menu.class);
                startActivity(intentsecurity);
                finish();
            }

        });
        Button reward = (Button)findViewById(R.id.reward);

        reward.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentreward = new Intent(MainActivity.this,user_m_ht_category_menu.class);
                startActivity(intentreward);
                finish();
            }

        });
        Button more = (Button)findViewById(R.id.more);

        more.setOnClickListener(new Button.OnClickListener() {

            public void onClick(View v) {
                Intent intentmore = new Intent(MainActivity.this,user_w_kb_nocticeboard.class);
                startActivity(intentmore);
                finish();
            }

        });
    }
}
