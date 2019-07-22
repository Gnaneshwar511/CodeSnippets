" MERGE INTO wwl03049_veri_sale_dcsn_dtl trgt " //
                    + " USING ( " //
                    + "           SELECT " //
                    + "               ? aff_no, " //
                    + "               ? ord_id, " //
                    + "               ? veri_sale_dcsn_flg, " //
                    + "               ? src_evnt_gen_dtm, " //
                    + "               ? vcs_score_gen_dtm " //
                    + "           FROM " //
                    + "               dual " //
                    + "       ) " //
                    + " srce ON ( srce.aff_no = trgt.aff_no " //
                    + "          AND srce.ord_id = trgt.ord_id ) " //
                    + " WHEN MATCHED THEN UPDATE SET trgt.veri_sale_dcsn_flg = srce.veri_sale_dcsn_flg, " //
                    + "                             trgt.src_evnt_gen_dtm = srce.src_evnt_gen_dtm, " //
                    + "                             trgt.vcs_score_gen_dtm = srce.vcs_score_gen_dtm " //
                    + " WHERE " //
                    + "    ( ( srce.src_evnt_gen_dtm > trgt.src_evnt_gen_dtm ) " //
                    + "      OR ( srce.src_evnt_gen_dtm = trgt.src_evnt_gen_dtm " //
                    + "           AND srce.vcs_score_gen_dtm > trgt.vcs_score_gen_dtm ) ) " //
                    + " WHEN NOT MATCHED THEN INSERT ( " //
                    + "    aff_no, " //
                    + "    ord_id, " //
                    + "    veri_sale_dcsn_flg, " //
                    + "    src_evnt_gen_dtm, " //
                    + "    vcs_score_gen_dtm ) VALUES ( " //
                    + "    srce.aff_no, " //
                    + "    srce.ord_id, " //
                    + "    srce.veri_sale_dcsn_flg, " //
                    + "    srce.src_evnt_gen_dtm, " //
                    + "    srce.vcs_score_gen_dtm )";
