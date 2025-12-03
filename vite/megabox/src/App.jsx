import BoxOfficeCard from './BoxOfficeCard.jsx';
import datas from './data.js';
import {datas} from './data.js';


function App() {
    
    return (
        <div className="box_office">
           {datas.map((ele)=>{return <BoxOfficeCard key={ele.rank} data={ele} />})}
        </div>
    );
}

export default App;``