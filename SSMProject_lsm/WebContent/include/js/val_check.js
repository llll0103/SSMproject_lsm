function val_check(val,i){
   if(i == 46){
      return true;
   }else{
      if(val == "" || val == null || val == "������ ������ �ּ���"){
         alert(i+"�� ������ Ȯ���� �ּ���.");
         return false;
      }else{
         return true;
      }
   }
   
}