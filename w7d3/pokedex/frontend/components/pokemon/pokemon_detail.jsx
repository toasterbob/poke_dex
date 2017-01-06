import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    const id = this.props.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.params.pokemonId !== newProps.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.params.pokemonId);
    }
  }

  render () {
    console.log(this.props);
    const pokemon = this.props.pokemonDetail;
    let items = (<li></li>);
    if (pokemon.items.length > 0) { items =  (
      <ul className="eggs">
        <li key={pokemon.items[0].id}>  <img height="100" src={pokemon.items[0].image_url}/></li>
        <li key={pokemon.items[1].id}>  <img height="100" src={pokemon.items[1].image_url}/></li>
        <li key={pokemon.items[2].id}>  <img height="100" src={pokemon.items[2].image_url}/></li>
    </ul>
  );}


    return (
      <div className="detail-div">
        {this.props.children}
        <ul>
          <img src={pokemon.image_url}/>
          <li>
            <h3>{pokemon.name}</h3>
          </li>
          <li> <h4>Type: {pokemon.poke_type}</h4> </li>
          <li> <h4>Attack: {pokemon.attack}</h4> </li>
          <li> <h4>Defense: {pokemon.defense}</h4> </li>
          <li>
            <h4>Moves: {pokemon.moves[0]}, {pokemon.moves[1]}</h4>
          </li>

        </ul>
        <ul className="itemsList">
          <li> <h4>Items</h4> </li>
          {items}
        </ul>
      </div>

    );
  }

}

export default PokemonDetail;
