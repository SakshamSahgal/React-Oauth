
import { useEffect, useState } from 'react';
import { fetchAPI } from './Scripts/Axios';

function App() {

  const [data, setData] = useState("loading");

  const fetchData = async () => {
    const response = await fetchAPI('/api');
    console.log(response);
    setData(response.data.message);
  }

  useEffect(() => {
    fetchData();
  }, []);

  return (
    <p>{data}</p>
  );
}

export default App;
