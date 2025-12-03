//index.js는 리액트의 입구 파일이다.
//실행은 my-app에서 통합터미널 열고 npm start
import ReactDOM from 'react-dom/client';
//import App from './App';//.js생략가능


import './index.css';

function App2() {
  return  <h1 className='txtColor' style={{border:'1px solid red'}}>Hello CRA</h1>;

}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App2 />);


