class Debouncer{
  final Duration delay;

  Debouncer(this.delay);
  search(){

  }
}
void main(){
  Debouncer deb=Debouncer(Duration());
}

class Node{
  int data;
  Node? left,right;
  Node(this.data);
}

class Tree{
  Node? root;

  insertion(int data){
    Node? current=root;
    Node? newNode=root;
  if(current==null){
    root=newNode;
    return;
  }
  while(true){
    if(data<root!.data){
      if(current!.left==null){
        current.left=newNode;
        break;
      }
      current=current.left;

    }else{
      if(current!.right==null){
current.right=newNode;
break;
      }
    }
  }
  }
}