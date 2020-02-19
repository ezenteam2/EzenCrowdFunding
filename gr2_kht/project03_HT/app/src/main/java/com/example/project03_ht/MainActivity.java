package com.example.project03_ht;

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
        recommend.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                Intent myintent = new Intent(MainActivity.this,recommend.class);
                startActivity(myintent);
                finish();

            }
        });
    }
}