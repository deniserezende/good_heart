#include "tcp_thread.h"
#include "dhcp/dhcp_setup.h"

NX_TCP_SOCKET socket_echo;

char data[100];

/* TCP Thread entry function */
void tcp_thread_entry(void)
{
   UINT error_counter = 0;
   UINT status;
   ULONG bytes_copied;
   NX_PACKET       *packet_ptr;

   /* Wait for the IP stack and network hardware
    * to get initialized.
    */
   tx_thread_sleep(3 *NX_IP_PERIODIC_RATE);

   /* Start and run a brief DHCP Client session. */
   status = run_dhcp_client_session(&g_dhcp_client0, &g_ip0);

   /* Check for successful result. */
   if (status)
       error_counter++;

/* Create a socket.  */
  status =  nx_tcp_socket_create(&g_ip0, &socket_echo, "Echo Server Socket",
                              NX_IP_NORMAL, NX_FRAGMENT_OKAY, NX_IP_TIME_TO_LIVE, 512,
                              NX_NULL, NX_NULL);

  /* Check for error.  */
  if (status)
      error_counter++;

  /* Setup this thread to listen.  */
  status =  nx_tcp_server_socket_listen(&g_ip0, 3333, &socket_echo, 5,NX_NULL);

  /* Check for error.  */
  if (status)
      error_counter++;

  /* Loop to create and establish server connections.  */
  while(1)
  {

      /* Accept a client socket connection.  */
      status =  nx_tcp_server_socket_accept(&socket_echo, NX_WAIT_FOREVER);

      /* Check for error.  */
      if (status)
          error_counter++;

      while(1)
      {
          /* Receive a TCP message from the socket.  */
          status =  nx_tcp_socket_receive(&socket_echo, &packet_ptr, NX_WAIT_FOREVER);

          //nx_packet_data_extract_offset(packet_ptr, 0, &data, 100, &bytes_copied);

          /* Check for error.  */
          if (status)
          {
              /* most likely got disconnected */
              error_counter++;
              break;
          }
          else
          {
              /* Echo back the received data this will also release the packet */
              nx_tcp_socket_send(&socket_echo, packet_ptr, NX_WAIT_FOREVER);
          }
      }
      /* Disconnect the server socket.  */
      //status =  nx_tcp_socket_disconnect(&socket_echo, NX_WAIT_FOREVER);

      /* Check for error.  */
     // if (status)
     //     error_counter++;

      /* Unaccept the server socket.  */
      //status =  nx_tcp_server_socket_unaccept(&socket_echo);

      /* Check for error.  */
      //if (status)
     //     error_counter++;

      /* Setup server socket for listening again.  */
      //status =  nx_tcp_server_socket_relisten(&g_ip0, 7, &socket_echo);

      /* Check for error.  */
      if (status)
          error_counter++;
  }

   /* Application has finished */
   while(1);
}
