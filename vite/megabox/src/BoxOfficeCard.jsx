import "./css/reset.css";
import "./css/BoxOfficeCard.css";
import poster from "/images/YiSbqEf6OvFcDoLoQCipDojOHqMCwKG4_420.jpg";
// public 폴더에 이미지가 들어 있을때('/'로 시작)
// import mx4d from "./images/type_mega_mx4d.png";
// import cinema from "./images/type_dolbycinema.png";
// import atmos from "./images/type_dolbyatmos.png";
// import ageAll from "./images/ALL_56x56.png";

        function BoxOfficeCard({data}) {

            return (
                <div className="box_office_card">
                    <div className="inner">
                        <div className="front">
                            <span className="rank">{data.rank}</span>
                            <div className="poster">
                                <img src={poster} alt={data.title} />
                            </div>
                            <div className="screen_type">
                                {data.screenTypes.map((ele,idx)=><img src={data.screenTypes[idx]} alt="screentypes" />)}
                                {data.screenTypes.map <img key={ele} alt="screentypes" />)}
                                <img src={data.screenTypes[0]} alt="Mega MX4D" />
                                <img src={data.screenTypes[1]} alt="Dolby Cinema" />
                                <img src={data.screenTypes[2]} alt="Dolby Atmos" />
                            </div>
                            <div className="movie_grade">
                                <img src={ageAll} alt={"Movie Grade" + data.age} />
                            </div>
                        </div>
                        <div className="back">
                            <p>{data.description}</p>
                            <div className="score">관람평<span>{data.score}</span></div>
                        </div>
                    </div>
                    <div className="btn">
                        <button type="button" className="like">
                            <i className="fa-regular fa-heart"></i>{data.like}
                        </button>
                        <a href="https://www.megabox.co.kr/booking" className="reservation_link">예매</a>
                    </div>
                </div>
            );
        }

export default BoxOfficeCard;