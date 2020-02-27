package com.example.project3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class user_m_ys_myaccount extends AppCompatActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_m_ys_myaccount);

        Button chargeDepositBtn = (Button) findViewById(R.id.chargeDepositBtn);
        chargeDepositBtn.setOnClickListener(account);
    }

    View.OnClickListener account = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent intent = new Intent(getApplicationContext(), user_m_ys_chargedeposit.class);
            startActivity(intent);
            finish();
        }
    };
}