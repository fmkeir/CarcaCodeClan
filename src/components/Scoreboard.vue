<template lang="html">
  <div class="scoreboard">
    <div class="header">
      <span class="title">Scoreboard</span>
      <div class="player-input" v-if="this.players.length < 5">
       <input type="text" id="player-name" placeholder="name" v-model="playerName"/>
       <button @click="addPlayer">Add Player</button>
      </div>
    </div>
    <div class="players-display">
      <div v-for="player in players" class="player-details">
        <input type="number" placeholder="0" min="0">
       <p class="name"> {{player}} </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Scoreboard',
  data() {
    return {
      players: [],
      playerName: ""
    }
  },
  methods: {
    addPlayer: function () {
      this.players.push(this.playerName)
      this.playerName = ""
    }
  }
}
</script>

<style lang="css" scoped>
.scoreboard {
  width: 40vw;
  height: 17vh;
  background-color: lightgrey;
  padding: 0.5%;
  margin: 0 auto;
}

.header {
  display: flex;
  justify-content: space-between;
}

.title {
  font-size: 4vh;
}

.player-input {
  width: 60%;
  text-align: right;
}

.player-input button {
  padding: 0.5%;
  border: none;
  background: none;
  font-family: Luminari;
  font-size: 2vh
}

.player-input input {
  width: 8vw;
  margin: 0.5vh 0.25vw 0 0.25vw;
  font-family: Luminari;
  font-size: 2vh;
}

.players-display {
  display: flex;
  height: 80px;
  width: 100%;
  margin: 0 auto;
}

.player-details {
  width: 7vw;
  height: 10vh;
  margin: 0.2vw;
  text-align: center;
  padding: 0.5vh;
}

.player-details input {
  width: 40px;
  font-size: 3vh;
  text-align: center;
  border: none;
  background: none;
  font-family: Luminari;
}

.name{
  font-size: 3vh;
}
</style>
