// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:web3dart/web3dart.dart';
//
// class ChatMessengerApp extends StatefulWidget {
//   @override
//   _ChatMessengerAppState createState() => _ChatMessengerAppState();
// }
//
// class _ChatMessengerAppState extends State<ChatMessengerApp> {
//   final String rpcUrl = 'https://rpc-mumbai.maticvigil.com';
//   final String contractAddress = '0x46213Bbf66e7B43834DBef405F9A9f7533BF889b';
//   final String privateKey = '7d2f72be8e26c40f9385ba26e84fdd0bca679f2088fd866cb3ec96f53ddb5053'; // account 2
//   final String publicKey = '0x2fF54AFA632deeE3B790e3441f82fD4edB5614A7';
//   final String contactPublicKey = '0x66518c552B2e6425995b1597243392084f212b4c';
//
//   late Web3Client client;
//   late DeployedContract contract;
//   late Credentials credentials;
//   String myProfile = '';
//   List<String> messages = [];
//   TextEditingController messageController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     initializeWeb3();
//     connectToContract();
//     getMyProfile();
//     getMyMessages(contactPublicKey);
//   }
//
//   void initializeWeb3() {
//     client = Web3Client(rpcUrl, Client());
//   }
//
//   void connectToContract() async {
//     String abi =
//         '[ { "inputs": [ { "internalType": "address", "name": "_contactAddress", "type": "address" } ], "name": "addContact", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "string", "name": "_name", "type": "string" } ], "name": "createProfile", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "anonymous": false, "inputs": [ { "indexed": true, "internalType": "address", "name": "sender", "type": "address" }, { "indexed": true, "internalType": "address", "name": "recipient", "type": "address" }, { "indexed": false, "internalType": "string", "name": "message", "type": "string" } ], "name": "MessageSent", "type": "event" }, { "inputs": [ { "internalType": "address", "name": "_recipient", "type": "address" }, { "internalType": "string", "name": "_message", "type": "string" } ], "name": "sendMessage", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [ { "internalType": "address", "name": "_contactAddress", "type": "address" } ], "name": "getMyMessage", "outputs": [ { "internalType": "string[]", "name": "", "type": "string[]" } ], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "getMyProfile", "outputs": [ { "internalType": "string", "name": "", "type": "string" } ], "stateMutability": "view", "type": "function" }, { "inputs": [ { "internalType": "address", "name": "", "type": "address" } ], "name": "profiles", "outputs": [ { "internalType": "string", "name": "name", "type": "string" }, { "internalType": "address", "name": "userAddress", "type": "address" } ], "stateMutability": "view", "type": "function" } ]';
//     contract = DeployedContract(
//         ContractAbi.fromJson(abi, 'ChatMessenger'), EthereumAddress.fromHex(contractAddress));
//     credentials = EthPrivateKey.fromHex(privateKey);
//   }
//
//   void getMyProfile() async {
//     final profileFunction = contract.function('getMyProfile');
//     final result = await client.call(
//         contract: contract,
//         function: profileFunction,
//         params: [],
//         sender: EthereumAddress.fromHex(publicKey));
//     setState(() {
//       myProfile = result[0] as String;
//     });
//   }
//
//   void getMyMessages(String contactAddress) async {
//     final myAddress = await credentials.extractAddress();
//     final messagesFunction = contract.function('getMyMessage');
//     final result = await client.call(
//         contract: contract,
//         function: messagesFunction,
//         params: [EthereumAddress.fromHex(contactAddress)],
//         sender: EthereumAddress.fromHex(publicKey));
//     setState(() {
//       messages = (result[0] as List<dynamic>).map((message) => message as String).toList();
//     });
//   }
//
//   void sendMessage(String recipient, String message) async {
//     final sendMessageFunction = contract.function('sendMessage');
//     final transaction = await client.sendTransaction(
//         credentials,
//         Transaction.callContract(
//             contract: contract,
//             function: sendMessageFunction,
//             parameters: [EthereumAddress.fromHex(recipient), message]),
//         chainId: 80001);
//     Future.delayed(const Duration(seconds: 5), () {
//       getMyMessages(recipient);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat Messenger'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(children: [
//           Text(
//             'My Profile: $myProfile',
//             style: const TextStyle(fontSize: 18),
//           ),
//           const SizedBox(height: 20),
//           const Text('Messages:', style: TextStyle(fontSize: 18)),
//           const SizedBox(height: 10),
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return  Container(
//                   height: 30,
//                   child: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: messageController,
//             decoration: const InputDecoration(
//               labelText: 'Message',
//             ),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               sendMessage(contactPublicKey, messageController.text);
//               messageController.clear();
//             },
//             child: const Text('Send Message'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               getMyMessages(contactPublicKey);
//             },
//             child: const Text('Get Messages'),
//           )
//         ]),
//       ),
//     );
//   }
//
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ChatMessengerApp(),
//   ));
// }
