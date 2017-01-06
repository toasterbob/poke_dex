import React from 'react';

export default ({item}) => {

  return (
    <ul>
      <li><h3>{item.name}</h3></li>
      <li><h4>{item.happiness}</h4></li>
      <li><h4>{item.price}</h4></li>
    </ul>
  );

};
