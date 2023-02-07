import logo from './logo.svg';
import './App.css';
import {useEffect , useState} from 'react';
import axios from "axios";


function App() {
  
  const [getdata, setdata ]= useState(null)
    useEffect(() => {
      // GET request using fetch inside useEffect React hook
      axios.get("/api")
      .then((response =>console.log(response.data)))
      .then((data => setdata(data)));
      
  //empty dependency array means this effect will only run once (like componentDidMount in classes)
  }, []);

  console.log(getdata)

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.save 
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React 
        </a>

        <p>{getdata}</p>
      </header>
     
    </div>
  );
}

export default App;
