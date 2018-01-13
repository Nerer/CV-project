#!/bin/bash

# Switch to script directory
cd `dirname -- "$0"`

TEST='train_e_tracks'
shift

export OMP_NUM_THREADS=1

if [[ "$TEST" == 'eval_TORCS_e_tracks' ]]; then
  qlua main.lua -mode eval -discrete true -env TORCS.TorcsDiscreteConstDamagePos -foldername train_e_tracks "$@"
elif [[ "$TEST" == 'eval_TORCS_ushite' ]]; then
  qlua main.lua -mode eval -discrete true -env TORCS.TorcsDiscreteConstDamagePos -foldername train_TORCS_slowmulti_ushite_city "$@"
elif [[ "$TEST" == 'train_e_tracks' ]]; then
  th main.lua -seed 1 -server false -resume false -discrete true -gpu 0 -game_config e-track.xml -env TORCS.TorcsDiscreteConstDamagePos -threads 12 -model models.Discrete_action -hiddenSize 256 -height 84 -width 84 -batchSize 5 -momentum 0.99 -rmsEpsilon 0.1 -steps 20000000 -optimiser sharedRmsProp -eta 0.00007 -gradClip 0 -rewardClip 0 -valSteps 18750 -valFreq 250000 -tensorType torch.FloatTensor -entropyBeta 0.01 -progFreq 5000 -verbose false -foldername train_e_tracks -group 0 "$@"

elif [[ "$TEST" == 'train_TORCS_ushite_city' ]]; then
  th main.lua -seed 1 -server false -resume false -discrete true -gpu 0 -game_config quickrace_discrete_slowmulti_ushite-city.xml -env TORCS.TorcsDiscreteConstDamagePos -threads 12 -model models.Discrete_action -hiddenSize 256 -height 84 -width 84 -batchSize 5 -momentum 0.99 -rmsEpsilon 0.1 -steps 20000000 -optimiser sharedRmsProp -eta 0.00007 -gradClip 0 -rewardClip 0 -valSteps 18750 -valFreq 250000 -tensorType torch.FloatTensor -entropyBeta 0.01 -progFreq 5000 -verbose false -foldername train_TORCS_ushite_city -group 0 "$@"
else
  echo 'Invalid args.'
fi
