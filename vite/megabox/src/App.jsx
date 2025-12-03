import BoxOfficeCard from './BoxOfficeCard.jsx';
import datas from './data.js';


function App() {
    const datas.map(()=>{<BoxOfficeCard/>});
    return (
        <div className="box_office">
            <BoxOfficeCard />
        </div>
    );
}

export default App;