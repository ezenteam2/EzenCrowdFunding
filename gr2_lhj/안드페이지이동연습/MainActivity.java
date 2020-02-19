package com.cookandroid.a03_intent;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

//하나의 activity는 화면으로 연결되어 있다.
public class MainActivity extends AppCompatActivity {

    /*
    # 화면 로딩 처리 순서
    1. MainActivity 실행
    2. onCreate()를 통해 생성될 때, 처리할 객체 생성.
    3. setContentView(xml이 있는 위치 resource 기준) xml에 있는 객체들을 메모리에 로딩 처리.
    4. 각 객체들을 식별하는 식별자를 기준으로 객체에 참조 변수를 할당할 수 있다.
        xml에서 선언되어 있는 @+id/아이디명을 식별자로 가지고 있기 때문에
        findViewById(R.id.@@)로 선택할 수 있다.
        이 메모리에 있는 각각의 객체들을 초기에 Object o = xml에서 선언할 객체.
        object로 된 type을 실제 객체로 활용하기 위해서는 typecasting이 필요하다.
        Button btn = (Button)findViewById(R.id.btn01);
        해당 typecasting을 통해서 실제 객체로 된 상황에서 여러가지 메서드를 사용할 수 있다.
     */
    EditText editText;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // setContentView를 통해서..
        // R. : res 하위 폴드.
        // .layout : layout 폴드
        // .activity_main : activity_main.xml 파일을 호출한다.

        setContentView(R.layout.activity_main);
        /*
        # activity_main.xml
        안에 선언된 tag의 객체들을 inflate 하면서 메모리에 로딩한다.
         */
        // 1. xml에 있는 객체 가져오기..
        //    findViewById(R.id.객체의 id)
        // 2. 객체의 type을 typecasting 처리..
        // 3. 해당 객체의 메모리에 할당. 처리..

        TextView tv = (TextView) findViewById(R.id.txt01);
        tv.setText("내용변경");
        Button btn01 = (Button) findViewById(R.id.btn01);
        editText = (EditText)findViewById(R.id.editText);
        btn01.setText("!!!내용변경!!");
        ImageView img01 =(ImageView)findViewById(R.id.imageView);
        //버튼을 클릭시, 이벤트가 발생하고, 해당 이벤트를 통해서
        // 변경되는 내용을 처리해보자..
        // 객체로 된 상황에서 참조변수 .setXXXX(변경할 속상값)
        // 저장하여 동적으로 해당 객체를 변경할 수 있다.
        /*
        # 이벤트 처리.
        1. 대상 객체 지정..
        2. 대상에서 이벤트 인식할 수 있는 감각장치를 할당하여야, 해당 이벤트를 인식할 수 있다.
            ex) Click이라는 이벤트를 인식하기 위해서는 click 인지할 수 있는 Listener를 장착하여야 한다..
        3. 해당 Listener 클래스를 통해서 객체가 생성되어 있어야 되고, 이 개체를 setOnClickListener를 통해서 할당하여야 한다.
        click를 인짛라 수 있는 Listener 클래스 선언..

        # 이벤트
        1. 감각장치를 붙일 대상객체를 지정 (btn01)
        2. 어떤 감각 장치를 붙일 것인가를 지정.
            .setOnClickListener
            set : 저장합니다.
            OnClick :
        3. 감각장치를 통해 수행할 내용
            1) 해당 객체를 생성..
            new View.OnClickListener()
            2) 익명클래스 선언..
            OnClickListener의 구현 내용을 객체마다 다르게 선언하여야 하므로 익명 클래스 사용.
         */
        btn01.setOnClickListener(this.mclick);
        /*
        intent int01 = new Intent(Main.this, 호출할 acivity 클래스.class);
        startActivity(int01)
         */

        img01.setOnClickListener(this.mclick);
    }
    View.OnClickListener mclick= new View.OnClickListener() {
        // 이 클래스를 통해서, 특정한 이벤트 click를 했을 때, 처리할 내용을  기술한다.
        @Override
        public void onClick(View v) {
            Toast.makeText(getApplicationContext(),
                    "입력한 이름:"+editText.getText(), Toast.LENGTH_LONG).show();
            Button btn01 = (Button) findViewById(R.id.btn01);
            btn01.setText("dd");
            /*
            화면 전환 처리..
            1. Intent 선언
                생성자 : 현재 activity의 context와 전환될 Activity클래스를 선언.
            2. startActivity(선언내용)
                해당 Activity 화면으로 전환처리..
             */
            Intent int01 = new Intent(getApplicationContext(),SubActivity.class);
            //데이터 전달 : name이름으로 입력된 데이터 전달..
            int01.putExtra("name", editText.getText());



            // 해당 activity 로딩 시작..
            startActivity(int01);
        }
    };
}
