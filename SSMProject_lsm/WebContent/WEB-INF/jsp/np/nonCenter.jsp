<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%
   request.setCharacterEncoding("EUC-KR");
%>
<%@ page import="ssm.np.vo.Non_CenterVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%
   Object obj1 = request.getAttribute("ncList"); 
      System.out.println("obj >>> : " +obj1);
      String result="";
      
      ArrayList<Non_CenterVO> aList = (ArrayList<Non_CenterVO>) obj1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������м���</title>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<script src="/common/ssmJs/index.js"></script>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8da6b2781270c75565f674a8526d670&libraries=services"></script>
<script type="text/javascript">
   $(function(){
      var tab = "tab1";
      val(tab);
   });
   function val(data){
      $(".tab1").hide();
      $(".tab2").hide();
      $(".tab3").hide();
      $("."+data).show();
   }
</script>
<style type="text/css">

/* Tag Definition */
* {font-style:normal /* em, dfn, var, cite, address */;
 /*font-family:"�������", "NanumGothic" , "����", dotum, sans-serif; */
 font-family: "NanumSquare", "NanumGothic" , "����", dotum, sans-serif;
 margin:0; padding:0;}
 
 
 
table.infowindo {
   font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
   border: 1px solid #52A4E6;
   min-width: 300px;
   text-align: center;
   border-collapse: collapse;
}

table.infowindo td {
   width: 80px;
   border: 0px solid #AAAAAA;
   padding: 3px 2px;
     background:#53888b91 80%;
   text-align:left;
    font-weight: bold;
    color:#3b413b;
   
}
table.infowindo th {
   width: 80px;
   border: 0px solid #AAAAAA;
   padding: 3px 2px;
      background:cadetblue;
   
}
table.infowindo tbody td {
   font-size: 13px;
}

table.infowindo thead {
   background: #1C6EA4;
   background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
}

table.infowindo thead th {
   font-size: 15px;
   font-weight: bold;
   color: #FFFFFF;
   text-align: center;
}

table.infowindo tfoot {
   font-size: 10px;
   font-weight: bold;
   border-top: 1px solid #444444;
   /*
   background: #1C6EA4;
   background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
   background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
*/
}

table.infowindo tfoot td {
background:cadetblue;
   font-size: 10px;
}

table.infowindo tfoot .links {
   text-align: left;
}

table.infowindo tfoot .links a {
   display: inline-block;
   background: #35A490;
   color: #FFFFFF;
   padding: 2px 8px;
   border-radius: 5px;
}

.left-box {
   float: left;
   width: 50%;
   height: 100%;
   margin-bottom : 10px;
}

.right-box {
   float: right;
   width: 50%;
   height: 100%
}

.centerDiv {
   font-size : 20px;
   font-weight : bold;
   margin : 10px 0;
}
</style>
</head>
<body>
   <div id="wrap">
      <%@include file="/common/ssmMain/header_.jsp"%>
      <div class="subWrap">
       <%
      if(sessionAU.equals("1")){%>
         <nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
   
      <%
         }else if(sessionAU.equals("2") || sessionAU.equals("3")){%>
            <nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
      <%
         }
      %>
         <section>
          <div id="tit">
             <h1>�츮���� ����ü����������</h1>
             <p>
                <a href="#">Ȩ</a> > <a href="co01.asp">�񱳰����α׷�</a> > <a
                   href="co03.asp" class="on">����ü����������</a>
             </p>
          </div>
          <div class="container">
            <div id="content">
            

               <!--�Խ���-->

            
               <div class='left-box'>
                  <div class="centerDiv">
                  <span>�츮��������</span>
                  </div>

               <p>����ü���������� ������ �����մϴ�</p>
                  <table class="view_box mt_10" style="width: 80%; margin: auto;">
                     <colgroup>
                        <col width="40%">
                        <col width="60%">
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col" class="first">����ü����������</th>
                           <th scope="col" class="last">��ȭ��ȣ</th>
                        </tr>
                     </thead>

                     <tbody id="oprInstList">
                        <%
                           for(int i =0; i<aList.size(); i++){  
                                                                                                Non_CenterVO ncVo = aList.get(i);
                              if(i > 0 && i <= 10){
                        %>
                        <tr class="tab1">
                           <th scope="row" style="border-left: 0;"><%=ncVo.getNcName()%>
                              <a href="#">
                                 <button onclick="abc('<%=i%>','<%=ncVo.getNcAddress()%>')">��ġ</button>
                           </a></th>
                           <td style="border-right: 0;"><%=ncVo.getNcTel()%></td>
                        </tr>
                        <%       
                              }else if(i > 10 && i <= 20){
                                 %>
                                 <tr class="tab2">
                                    <th scope="row" style="border-left: 0;"><%=ncVo.getNcName()%>
                                       <a href="#">
                                          <button onclick="abc('<%=i%>','<%=ncVo.getNcAddress()%>')">��ġ</button>
                                    </a></th>
                                    <td style="border-right: 0;"><%=ncVo.getNcTel()%></td>
                                 </tr>
                                 <%          
                              }else{
                                 %>
                                 <tr class="tab3">
                                    <th scope="row" style="border-left: 0;"><%=ncVo.getNcName()%>
                                       <a href="#">
                                          <button onclick="abc('<%=i%>','<%=ncVo.getNcAddress()%>')">��ġ</button>
                                    </a></th>
                                    <td style="border-right: 0;"><%=ncVo.getNcTel()%></td>
                                 </tr>
                                 <%          
                              }                                                                  System.out.println("getNcName >> : " + ncVo.getNcName());
                        %>
                        
                        <%
                           }
                        %>
                        <tr>
                           <a href="#">
                              <button onclick="val('tab1')" class="pageNo2">1</button>
                           </a>
                           <a href="#">
                              <button onclick="val('tab2')" class="pageNo2">2</button>
                           </a>
                           <a href="#">
                              <button onclick="val('tab3')" class="pageNo2">3</button>
                           </a>
                        </tr>
                     </tbody>
                  </table>
               </div>


               <div class='right-box'>
                  <div id="map"
                     style="width: 100%; height: 500px; margin-top: 50px;"
                     class="right"></div>
               </div>
               <script>
              
               var mapContainer = document.getElementById('map');
               var mapOption = {
                   center: new daum.maps.LatLng(37.504985, 127.024737),
                   level: 7
               };  
         
               var map = new daum.maps.Map(mapContainer, mapOption); 
               
               
               
               // �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
               var mapTypeControl = new kakao.maps.MapTypeControl();
         
               // ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
               // kakao.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
               map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
         
               // ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
               var zoomControl = new kakao.maps.ZoomControl();
               map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
               
               //�ּ�->�����浵
               var geocoder = new daum.maps.services.Geocoder();
         
               //���� ������ �迭�� 
               var listData = [
               <%for(int i =0; i<aList.size(); i++){  
                     Non_CenterVO ncVo = aList.get(i);
                     System.out.println("getNcName >> : " + ncVo.getNcName());%>           
                               {
                                  ind: '<%=i%>',
                                  name: '<%=ncVo.getNcName()%>'
                                  ,group : '<%=ncVo.getNcPosition()%>'
                                  ,phone : '<%=ncVo.getNcTel()%>'
                                  ,email : '<%=ncVo.getNcEmail()%>'
                                 ,address:'<%=ncVo.getNcAddress()%>'
                                 ,homePage :'<%=ncVo.getNcHomepage()%>'
                               },
                               
                             <%} //for��%>   
               ]
               
                  var markers=[]; //��Ŀ�� �迭�� ���� 
                  var infos = [];   //infowindowâ �迭�ΰ���            
                  var bounds = new kakao.maps.LatLngBounds(); 
                  var level = map.getLevel();
                  
                  function abc(index,address) {
                      
                      geocoder.addressSearch(address, function(result, status){
                          if (status === daum.maps.services.Status.OK) {
                              var coords = new daum.maps.LatLng(result[0].y, result[0].x),
                              //itemEl = getListItem(index, coords),
                              selectedMarker = null;
                              
                             
                              //������ ǥ�õǰ� �ִ� ������Ŀ�� ����â ����
                               removeMarker();
                               closeInfoWindow();
                               
                               bounds.extend(coords);
                               //���������缳��
                               setBounds();
                           
                              
                              
                              //�ش� ��ǥ�� �߽� �̵�
                               map.panTo(coords);
                            
                              //��Ŀǥ��
                              var marker = new daum.maps.Marker({
                                 title: listData[index].ind,
                                  map: map,
                                  position: coords
                                  , clickable: true
                              });
                              marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
                            markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
                            
                            //����âǥ��
                              var infowindow = new daum.maps.InfoWindow({
                                 title: listData[index].ind,
                                  content: '<table class="infowindo"><thead><tr><th colspan="2">'+listData[index].name
                                     +'</th></tr></thead><tbody><tr><td width="20px">�Ҽ�</td><td>'+
                                     listData[index].group+'</td></tr><tr><td>����ó</td><td>'
                                     +listData[index].phone+'</td></tr><tr><td>����� �̸���</td><td>'
                                     +listData[index].email+'</td></tr><tr><td>�ּ�</td><td>'
                                     +listData[index].address+'</td></tr></tbody><tfoot><tr><td colspan="2"><div class="links"><a class="active" href="'
                                     +listData[index].homePage+'">Ȩ������</a></div></td></tr></tfoot></table>'   
    
                                  ,removable : true   //�ݱ�ǥ��
                                  //,disableAutoPan: true
                              });
                              infos.push(infowindow);
                              marker.setZIndex(index);
                                 //infowindow.open(map, marker);
                                // kakao.maps.event.addListener(marker, 'click', function() {
                                  // ��Ŀ ���� ���������츦 ǥ���մϴ�                                 
                                  //infowindow.open(map, marker);  
                                  //alert (marker.getZIndex()); // 4
                                  
                                  //});
                          
                                 
                                 //(function(marker, title) {
                                    //kakao.maps.event.addListener(marker, 'click', function() {
                                        
                                       //if (!selectedMarker || selectedMarker !== marker) {
                                            // Ŭ���� ��Ŀ ��ü�� null�� �ƴϸ�
                                            // Ŭ���� ��Ŀ�� �̹����� �⺻ �̹����� �����ϰ�
                                            //!!selectedMarker && selectedMarker.removeMarker();
                                            //!!selectedMarker && selectedMarker.infowindow.close(marker);
                                            // ���� Ŭ���� ��Ŀ�� �̹����� Ŭ�� �̹����� �����մϴ�
                                            //marker.setImage(clickImage);
                                        //}
                                        // Ŭ���� ��Ŀ�� ���� Ŭ���� ��Ŀ ��ü�� �����մϴ�
                                       // selectedMarker = marker;
                                       infowindow.open(map, marker);  
                            
                                    //});
                                      
                                     //kakao.maps.event.addListener(marker, 'mouseout', function() {
                                       // infowindow.close();
                                     //});
                                     //itemEl.onmouseover =  function () {
                                     //   infowindow.open(map, marker);  
                                    // };
                                     //itemEl.onmouseout =  function () {
                                    //     infowindow.close();
                                     //};
                                // })(marker, listData[index].name);
                                 
                                 
                                 
                          }//if
                          
                      });
                     
                  }//listData
                  
                  // ����Ʈ������ �б���ġǥ�� 
                  var markerPosition  = new kakao.maps.LatLng(37.503079, 127.024285); 
                  
                  //�б���Ŀ�̹��� 
                  var imageSrc = '/file/bitlogo.PNG', // ��Ŀ�̹����� �ּ��Դϴ�    
                   imageSize = new kakao.maps.Size(80, 77), // ��Ŀ�̹����� ũ���Դϴ�
                   imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
                     
                  // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
                  var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
                  
                  // ��Ŀ�� �����մϴ�
                  var marker0 = new kakao.maps.Marker({
                      position: markerPosition,
                      image: markerImage
                  });
                  // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
                  marker0.setMap(map);
                  
                  
                  function move(aaa){
                     alert(aaa +" : "+ listData[aaa].name);
                     var position = marker[aaa].title;
                     alert(position);
                     map.setCenter(position);
                  }
   
                  // �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
                  //function getListItem(index, places) {
                  //    var el = document.createElement('li'),
                  //    itemStr = '<div>��</div>';           
                   //   el.innerHTML = itemStr;
                  //    el.className = 'item';
                   //   return el;
                  //}
                  
                  
                  function setBounds() {
                      // LatLngBounds ��ü�� �߰��� ��ǥ���� �������� ������ ������ �缳���մϴ�
                      // �̶� ������ �߽���ǥ�� ������ ����� �� �ֽ��ϴ�
                       //���� ���� �ٽ� ����
                      map.setLevel(6);
                      //map.setBounds(bounds);
                  }
                  
                  // ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
                  function removeMarker() {
                      for ( var i = 0; i < markers.length; i++ ) {
                          markers[i].setMap(null);
                      }   
                      markers = [];
                  }
                  function closeInfoWindow() {
                      for ( var i = 0; i < infos.length; i++ ) {
                          infos[i].setMap(null);
                      }   
                      infos = [];
                  }
                  
            </script>
            </div>
            </div>
         </section>
      </div>
      <footer include-html="/common/ssmMain/footer.html"></footer>
   </div>
   <script>
      includeHTML();
   </script>
</body>

</html>