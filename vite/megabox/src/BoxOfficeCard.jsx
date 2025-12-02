import "./BoxOfficeCard.css";

        function BoxOfficeCard() {

            return (
                <div className="box_office_card">
                    <div className="inner">
                        <div className="front">
                            <span className="rank">1</span>
                            <div className="poster">
                                <img src="images/YiSbqEf6OvFcDoLoQCipDojOHqMCwKG4_420.jpg" alt="주토피아" />
                            </div>
                            <div className="screen_type">
                                <img src="images/type_mega_mx4d.png" alt="Mega MX4D" />
                                <img src="images/type_dolbycinema.png" alt="Dolby Cinema" />
                                <img src="images/type_dolbyatmos.png" alt="Dolby Atmos" />
                            </div>
                            <div className="movie_grade">
                                <img src="images/ALL_56x56.png" alt="Movie Grade All" />
                            </div>
                        </div>
                        <div className="back">
                            <p>더 화려해진 세계, 더 넓어진 주토피아!<br />디즈니의 가~~장 사랑스러운 콤비 '주디'와 '닉'이 돌아온다!<br /><br />미스터리한 뱀 '게리'가 나타난 순간.</p>
                            <div className="score">관람평<span>9.3</span></div>
                        </div>
                    </div>
                    <div className="btn">
                        <button type="button" className="like">
                            <i className="fa-regular fa-heart"></i>3.6k
                        </button>
                        <a href="https://www.megabox.co.kr/booking" className="reservation_link">예매</a>
                    </div>
                </div>
            );
        }

export default BoxOfficeCard;