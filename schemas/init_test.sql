create procedure init()
language plpgsql
as $$
declare
    test_client_id uuid;
    test_user_id uuid;
begin
    test_client_id := public.gen_rand_uuid();
    test_user_id  test_client_id;

    call client.client_add(
        test_client_id,
        'test',
        'test',
        'test client'
    );

    call iam.user_add(
        test_user_id,
        'test@mailinator.com',
        'tester';
    )
end
$$;

call init();
drop procedur init();