package com.example.project03_ht;


        import androidx.appcompat.app.AppCompatActivity;

        import android.content.Intent;
        import android.os.Bundle;
        import android.view.View;

        import android.widget.Button;
        import android.widget.ImageView;
        import android.widget.TextView;
        import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    TextView intent_textview;
    ImageView intent_imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_m_ht_category_menu);

        intent_textview = findViewById(R.id.textView);

        intent_textview.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent intent01 = new Intent(MainActivity.this, SubActivity.class);
                startActivity(intent01);
            }
        });
    }

    protected void onCreate02(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_m_ht_projects_detail);

        intent_imageView = findViewById(R.id.imageView6);

        intent_imageView.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent intent02 = new Intent(MainActivity.this, SubActivity02.class);
                startActivity(intent02);
            }
        });
    }
}