// import './App.css'
import {useState} from "react";

function Header(props)  {
  console.log(props,props.title);//title:React ,props React
  return(
      <header>
        <h1><a href="/" onClick={function(e){
          e.preventDefault(); /* 기본이벤트 방지 */
          // alert('경고창이 뜬다'); 일반적인 방법
          props.onChangeMode(); /*함수호출로 표현한다.  */

        }}>{props.title}</a>
        </h1>
      </header>
  );
}
function Nav(props)  {
  // const lis = [
  //     <li><a href="/read/1">html</a></li>,
  //     <li><a href="/read/2">css</a></li>,
  //     <li><a href="/read/3">js</a></li>
  // ]; 방법1

  // 방법2
  const lis = [];
  for (let i = 0; i <props.topics.length; i++) {
   let t = props.topics[i];
  //  lis.push(<li>{t.title}</li>)  read 내용도표시 하고 싶은 경우
   lis.push(<li key={t.id}>
    <a 
    id={t.id} 
    href={"/read/"+t.id} 
    onClick={(e)=>{
    e.preventDefault();
    props.onChangeMode(Number(e.target.id));
   }
   }>
    {t.title}
    </a>
    </li>
    ) 
  }
  return(
    <nav>
        <ol>
           {lis}
        </ol>
      </nav>
  );
}
function Article(props) {
  return (
     <article>
        <h2>{props.title}</h2>
        {props.body}
      </article>
  );
}

function Create(props) {
  return (
    <article>
      <h2>Create</h2>
      <form onSubmit={e=>{
        e.preventDefault();//submit효과제거

        console.log(e.target);//<form></form>
        console.log(e.target.title)//name='title'인것
        console.log(e.target.body)//name='body'인것

        const title = e.target.title.value;
        const body= e.target.body.value;
        props.onCreate(title,body);

      }} >
        <p><input type="text" name="title" placeholder="title" /></p>
        <p><textarea name="body" placeholder="body"></textarea></p>
        <p><input type="submit" value="Create"/></p>
      </form>
    </article>
  );

}
//App 컴포넌트는 sueState()로 지정한 변수 값이 변경되면 다시 실행된다.

function App() {
  // const _mode = useState('WELCOME');
  // const mode = _mode[0];
  // const setMode = _mode[1]
  //console.log('_mode',_mode);//['WELCOME',f]

  // const [변수,set변수] = useState('변수의초기값');
  const [mode,setMode] = useState('WELCOME');
  const [id,setId] = useState(null);
  const [nextId,setNextId] = useState(4);


  // const topics = [
  //   {id:1, title:'html', body:'hml is ...'},//topics[0]
  //   {id:2, title:'css', body:'css is ...'},//topics[1]
  //   {id:3, title:'javascript', body:'avascript is ...'}//topics[2]
  // ];
  const [topics,setTopics]=useState([
    {id:1, title:'html', body:'hml is ...'},
    {id:2, title:'css', body:'css is ...'},
    {id:3, title:'javascript', body:'avascript is ...'}
  ]);

  //CRUD(Create, Read, Update, Delete)
  let content = null;
      if (mode === 'WELCOME') {
          content =  <Article  title="Welcome" body="Hello,Web" ></Article>
      } else if (mode === 'READ') {
        let title;
        let body = null;

        for(let i = 0; i < topics.length; i++) {
          if (topics[i].id === id) {
            title = topics[i].title;
            body = topics[i].body;
          }
        }
          content =  <Article  title={title} body={body} ></Article>
      } else if (mode === 'CREATE') {
          content = <Create onCreate={(title,body)=>{
          const newTopic = {id:nextId,title:title,body:body};  
          /* 
            const newValue = {...value} 객체면 {}, 배열이면 []
            newValue 변경
            setValue(newValue)
          */
          const newTopics = [...topics];
          newTopics.push(newTopic);
          setTopics(newTopics);
          setMode('READ');
          setId(nextId);
          setNextId(nextId + 1);
          }}></Create>;
      }

  return (
    <div>
      {/* 헤더 */}
      {/* 위아래표현 모두 가능 */}
      {/* <Header /> */}
      {/* <Header title="WEB" onChangeMode={function(){alert('Header');}}></Header> */}
      {/* onChangeMode 사용자정의 속성 함수x */}
      <Header title="WEB" onChangeMode={()=>{setMode('WELCOME');}}></Header>
      {/* <Header></Header>
      <Header></Header> */}

      {/* 내비게이션 */}
      {/* <Nav topics={topics} onChangeMode={(id)=>{  alert(id); }}></Nav> */}
      <Nav topics={topics} onChangeMode={(_id)=>{setMode('READ'); setMode('Read');setId(_id);}}></Nav>

      {/* 아티클 */}
      {content}
      {/* <Article  title="Welcome" body="Hello,Web" ></Article>  if문으로 복사*/}
      {/* <Article  title="Hi" body="Hello,React" ></Article> */}

      {/* 생성(Create) = 추가(insert) 버튼 */}
        
      <a href="/create" onClick={e=>{
        e.preventDefault();
        setMode('CREATE');
      }}>Create</a>
    </div>
  )
}

export default App
