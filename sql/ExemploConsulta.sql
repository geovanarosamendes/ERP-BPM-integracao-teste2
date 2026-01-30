SELECT 
    p.PedidoID,
    p.DataPedido,
    p.Status,
    p.DataAprovacao,
    c.ClienteID,
    c.Nome AS ClienteNome,
    SUM(pi.Quantidade * pi.PrecoUnitario) AS ValorTotal
FROM Pedidos p
JOIN Clientes c ON p.ClienteID = c.ClienteID
JOIN PedidoItens pi ON p.PedidoID = pi.PedidoID
WHERE p.Status = 'APROVADO'
  AND p.IntegradoBPM = 0
GROUP BY
    p.PedidoID,
    p.DataPedido,
    p.Status,
    p.DataAprovacao,
    c.ClienteID,
    c.Nome
ORDER BY p.DataAprovacao;